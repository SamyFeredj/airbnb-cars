import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["dropdown"]

  connect() {
  }

  toggleDropdown(e) {
    const img = e.currentTarget;
    const dropdown = this.dropdownTarget;
    dropdown.classList.toggle("user-profile-clicked");
  }
}
