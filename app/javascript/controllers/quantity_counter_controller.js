import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "number"]

  minus() {
    const priceController = document.querySelector("[data-controller='price']");
    console.log(priceController);
    let currentValue = this.inputTarget.value;
    if (currentValue == "") {
      this.inputTarget.value = 0;
      this.numberTarget.innerText = 0;
      priceController.controller.computeTotalPrice(0);

    } else {
      const newValue = parseInt(currentValue) - 1;
      if (newValue < 0) {
        this.inputTarget.value = 0;
        this.numberTarget.innerText = 0;
        priceController.controller.computeTotalPrice(0);
      } else {
        this.inputTarget.value = newValue;
        this.numberTarget.innerText = newValue;
        priceController.controller.computeTotalPrice(newValue);
      }
    }
  }
  plus() {
    const priceController = document.querySelector("[data-controller='price']");
    console.log(priceController);
    let currentValue = this.inputTarget.value;
    if (currentValue == "") {
      this.inputTarget.value = 1;
      this.numberTarget.innerText = 1;
      priceController.controller.computeTotalPrice(1);
    } else {
      this.inputTarget.value = parseInt(currentValue) + 1;
      this.numberTarget.innerText = parseInt(currentValue) + 1;
      priceController.controller.computeTotalPrice(parseInt(currentValue) + 1);
    }
  }
}
