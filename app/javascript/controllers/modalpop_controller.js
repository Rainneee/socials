import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modalContent"]

  connect() {
    console.log("Modal is on?");
  }

  toggleModal(event) {
    const modalType = event.currentTarget.dataset.modalType;
    const modalContent = this.findModalContentByType(modalType);

    if (modalContent) {
      modalContent.classList.toggle("hidden");
    }
  }

  reload(event) {
    const modalType = event.currentTarget.dataset.modalType;
    const modalContent = this.findModalContentByType(modalType);
    if (modalContent) {
      modalContent.classList.add("hidden");
      window.location.reload();
    }
  }
  
  findModalContentByType(modalType) {
    return this.modalContentTargets.find(content => content.dataset.modalType === modalType);
  }

  stopPropagation(event) {
    event.stopPropagation();
  }
}
