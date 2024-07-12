const PowerShell = require("powershell");
const $ = require("jquery");
const path = require("path");
const fs = require("fs");

const information = document.getElementById("info");
information.innerText = `This app is using Chrome (v${window.versions.chrome()}), Node.js (v${window.versions.node()}), and Electron (v${window.versions.electron()})`;

const units = ["bytes", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"];

function niceBytes(x) {
  let l = 0,
    n = parseInt(x, 10) || 0;

  while (n >= 1024 && ++l) {
    n = n / 1024;
  }

  return n.toFixed(n < 10 && l > 0 ? 1 : 0) + " " + units[l];
}

async function PS(param) {
  let ps = new PowerShell(param);
  // Handle process errors (e.g. powershell not found)
  ps.on("error", (err) => {
    console.error(err);
  });
  // Stdout
  ps.on("output", (data) => {
    console.log(data);
    return data;
  });

  // Stderr
  ps.on("error-output", (data) => {
    console.error(data);
  });
}

async function initialize() {
  let GetComputerInformation = new PowerShell(
    "Get-ComputerInfo | ConvertTo-Json",
    { executionPolicy: "Bypass" }
  );

  GetComputerInformation.on("output", (data) => {
    RenderComputerInformation(data);
  });

  GetComputerInformation.on("error", (err) => {
    console.error(err);
  });
}

document.addEventListener("DOMContentLoaded", initialize);

function RenderComputerInformation(data) {
  let ComputerInfo = JSON.parse(data);
  document.getElementById("device-name").innerText = ComputerInfo.CsDNSHostName;
  document.getElementById("processor-name").innerText =
    ComputerInfo.CsProcessors[0].Name;
  document.getElementById("installed-ram").innerText =
    ComputerInfo.CsTotalPhysicalMemory +
    " (" +
    niceBytes(parseInt(ComputerInfo.CsTotalPhysicalMemory, 10)) +
    ")";
  document.getElementById("device-id").innerText;
  document.getElementById("architecture").innerText =
    ComputerInfo.OsArchitecture;

  // Windows Information
  document.getElementById("windows-edition").innerText = ComputerInfo.OsName;
  document.getElementById("windows-version").innerText = ComputerInfo.OsVersion;
  document.getElementById("windows-build").innerText =
    ComputerInfo.OsBuildNumber;

  document.getElementById("system-info-alert").classList.add("invisible");
}

function GenerateAlert(AlertText, AlertType) {
  const AlertBox = document.getElementById("alert-box");
  let Alert = document.createElement("div");

  switch (AlertType) {
    case "Warning":
      Alert.innerHTML = `<div class="alert alert-warning alert-dismissible fade show" role="alert" id="alert">${AlertText}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">Close</button></div>`;
      break;
    case "Success":
      Alert.innerHTML = `<div class="alert alert-success alert-dismissible fade show" role="alert" id="alert">${AlertText}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">Close</button></div>`;
      break;
    case "Danger":
      Alert.innerHTML = `<div class="alert alert-danger alert-dismissible fade show" role="alert" id="alert">${AlertText}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">Close</button></div>`;
      break;
    default:
      Alert.innerHTML = `<div class="alert alert-primary alert-dismissible fade show" role="alert" id="alert">${AlertText}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">Close</button></div>`;
      break;
  }

  AlertBox.append(Alert);

  var myAlert = document.getElementById("alert");
  var bsAlert = new bootstrap.Alert(myAlert);
  if (AlertType != "Danger") {
    setTimeout(function () {
      var alertNode = document.querySelector(".alert");
      var alert = bootstrap.Alert.getInstance(alertNode);
      alert.close();
    }, 5000);
  }
}

function RunPowerShell(DOMObject) {
  GenerateAlert("Running " + DOMObject.getAttribute("pwsh"), "Warning");
  let PowerShellScript = new PowerShell(
    '."src\\pwsh\\Windows\\' +
      DOMObject.getAttribute("id").split("-")[1] +
      "\\" +
      DOMObject.getAttribute("pwsh") +
      '"',
    { executionPolicy: "Bypass" }
  );

  PowerShellScript.on("error", (err) => {
    GenerateAlert(err, "Danger");
  });

  PowerShellScript.on("error-output", (data) => {
    GenerateAlert(data, "Danger");
    console.log(data);
  });

  PowerShellScript.on("output", (data) => {
    console.log(data);
  });

  PowerShellScript.on("end", (code) => {
    console.log(code);

    if (code == "0") {
      GenerateAlert(
        `Successfully Ran ${DOMObject.getAttribute("pwsh")}`,
        "Success"
      );
    } else {
      GenerateAlert("Return Code: " + data, "Danger");
    }
  });
}

document.addEventListener("change", function () {
  var chk = event.target;
  if (chk.type === "checkbox") {
    RunPowerShell(chk);
  }
});
