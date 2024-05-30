// app/javascript/controllers/clear_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("ClearForm controller connected");
    this.element.addEventListener("turbo:submit-end", () => {
      this.element.reset();
    });
  }
}
