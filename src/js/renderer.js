const PowerShell = require("powershell");
const $ = require("jquery");

const information = document.getElementById("info");
information.innerText = `This app is using Chrome (v${window.versions.chrome()}), Node.js (v${window.versions.node()}), and Electron (v${window.versions.electron()})`;

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
    "Get-ComputerInfo | ConvertTo-Json"
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
  console.log(ComputerInfo.CsDNSHostName);
  console.log(ComputerInfo.CsProcessors[0].Name);
}
