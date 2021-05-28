import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["price", "quantity"]
  static values = {
    offers: Object,
    offerPrice: Number
  }

  connect() {
    this.element.controller = this;
    this.offerPriceValue = 0;
  }

  changePrice() {
    this.offerPriceValue = parseInt(this.offersValue[event.currentTarget.value]);
  }

  computeTotalPrice(quantity) {
    const totalPrice = quantity * this.offerPriceValue;
    this.priceTarget.innerText = `Prix: ${totalPrice}`;
  }
}
