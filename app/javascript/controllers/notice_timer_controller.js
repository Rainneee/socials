import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notice-timer"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.remove();
    }, 5000);
  }
}
