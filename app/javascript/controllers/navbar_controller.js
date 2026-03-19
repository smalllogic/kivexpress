import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["mobileMenu", "openIcon", "closeIcon"]

  connect() {
    this.isOpen = false
  }

  toggle() {
    this.isOpen = !this.isOpen
    
    if (this.isOpen) {
      this.mobileMenuTarget.classList.remove("hidden")
      this.openIconTarget.classList.add("hidden")
      this.closeIconTarget.classList.remove("hidden")
    } else {
      this.mobileMenuTarget.classList.add("hidden")
      this.openIconTarget.classList.remove("hidden")
      this.closeIconTarget.classList.add("hidden")
    }
  }
}
