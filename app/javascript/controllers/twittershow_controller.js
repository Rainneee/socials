import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

// Connects to data-controller="twittershow"
export default class extends Controller {
  connect() {
    // Ensure data-ignore-click attribute is inherited by child elements
    this.inherit_ignoreClick();

    this.element.addEventListener('click', (e) => {
      const targetIgnoreClick = e.target.dataset.ignoreClick === 'true';

      if (!targetIgnoreClick) {
        Turbo.visit(this.element.dataset.tweetPath);
      }
    });
  }

  inherit_ignoreClick() {
    document.querySelectorAll('[data-ignore-click="true"]').forEach(parent => {
      parent.querySelectorAll('*').forEach(child => {
        child.setAttribute('data-ignore-click', 'true');
      });
    });
  }
}
