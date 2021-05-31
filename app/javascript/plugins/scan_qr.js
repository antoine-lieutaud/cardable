import QrScanner from 'qr-scanner';
QrScanner.WORKER_PATH = 'node_modules/qr-scanner/qr-scanner-worker.min.js';


const scanQR = () => {
  const video = document.getElementById('qr-video');
  const scanner = new QrScanner(video, successCallback, failureCallback)
  scanner.start()
}

const successCallback = (result) => {
  console.log("result", result)
  document.getElementById("console").innerText = result;
  window.location.replace(result);
  const btnValide = document.getElementsById("sweet-alert-demo").click();
  console.log(btnValide)
}

const failureCallback = (result) => {
  console.log("fail", result)
  document.getElementById("console").innerText = result;
  const btnInvalide = document.getElementsById("sweet-alert-demo2").click();
  console.log(btnInvalide)
}

export { scanQR };
