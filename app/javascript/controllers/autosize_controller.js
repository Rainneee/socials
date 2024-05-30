import { Controller } from "@hotwired/stimulus"
import autosize from "autosize"

// Connects to data-controller="autosize"
export default class extends Controller {
  connect() {
    this.resize();
  }

  resize() {
    autosize(this.element);
  }
}
