import QrScanner from 'qr-scanner';
import QrScannerWorkerPath from '!!file-loader!../../../node_modules/qr-scanner/qr-scanner-worker.min.js';

QrScanner.WORKER_PATH = QrScannerWorkerPath;


const scanQR = () => {
  const video = document.getElementById('qr-video');
  if (video) {
    const scanner = new QrScanner(video, successCallback, failureCallback)
    scanner.start();
  }
}

const successCallback = (result) => {
  console.log("result", result)

  const message = document.getElementById("console")
  if (message) {
    message.innerText = result;
  }
  document.getElementById("console").innerText = result;
  window.location.replace(result);
  const btnValide = document.getElementsById("sweet-alert-demo").click();
  console.log(btnValide)

}

const failureCallback = (result) => {
  console.log("fail", result)

  const message = document.getElementById("console")
  if (message) {
    message.innerText = result;
  }
  document.getElementById("console").innerText = result;
  const btnInvalide = document.getElementsById("sweet-alert-demo2").click();
  console.log(btnInvalide)

}

export { scanQR };
