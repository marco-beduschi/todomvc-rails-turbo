import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autofocus-input"
export default class extends Controller {
  connect() {
    this.element.focus();
  }
}
