import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["select"]
  connect() {
    $(this.selectTarget).on("change", () => {
      this.element.submit()
    })
  }
}
