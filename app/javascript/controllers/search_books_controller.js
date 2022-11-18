import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-books"
export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    // console.log(this.formTarget.action)
    // console.log(this.inputTarget.value)
    // console.log(this.listTarget)
  }

  update() {
    // console.log("here we go!")
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
     fetch(url, {headers: {"Accept": "text/plain"}})
       .then(response => response.text())
      .then((data) => {
      console.log(data)
        this.listTarget.outerHTML = data
       })
  }
}
