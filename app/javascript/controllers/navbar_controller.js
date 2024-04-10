import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  toggle() {
    const links = document.getElementById("mobile-links")
    const bars = document.getElementById("bars")
    const close = document.getElementById("close")

    links.classList.toggle("hidden")
    bars.classList.toggle("hidden")
    close.classList.toggle("hidden")
  }
}
