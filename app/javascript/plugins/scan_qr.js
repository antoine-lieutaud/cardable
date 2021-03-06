import QrScanner from 'qr-scanner';
import QrScannerWorkerPath from '!!file-loader!../../../node_modules/qr-scanner/qr-scanner-worker.min.js';

QrScanner.WORKER_PATH = QrScannerWorkerPath;


const scanQR = () => {
  const video = document.getElementById('qr-video');
  if (video) {
    QrScanner.hasCamera()
    .then(() => {
      const scanner = new QrScanner(video, successCallback, failureCallback)
      scanner.start().then(error => {if (error) console.log(error)});
    })
  }
}

const successCallback = (result) => {
  console.log("result", result)

  const message = document.getElementById("console")
  if (message) {
    message.innerText = result;
  }
  window.location.replace(result);
}

const failureCallback = (result) => {
  console.log("fail", result)

  const message = document.getElementById("console")
  if (message) {
    message.innerText = result;
  }
}

export { scanQR };
