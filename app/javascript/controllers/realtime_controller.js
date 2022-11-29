import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="realtime"
export default class extends Controller {

  static targets = ["body"]

  connect() {
    console.log(this.bodyTarget)
    console.log("Hello")
  }

  send(event) {
    event.preventDefault()
    const url = event.target.href;
    console.log(event.target)

    fetch(url, {
      method: "PATCH",
      headers: {"Accept": "text/plain"},
      body: event.target
    })
    .then(response => response.text())
    .then(data => this.bodyTarget.outerHTML = data)
  }
}
