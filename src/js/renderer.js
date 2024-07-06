const PowerShell = require("powershell");
const $ = require("jquery");

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

var tooltipTriggerList = [].slice.call(
  document.querySelectorAll('[data-bs-toggle="tooltip"]')
);
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl);
});
