import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-my-book-card"
export default class extends Controller {
  static targets = ["items", "btnaccept", "btnreject"]

  connect() {
    // console.log(this.element)
    // console.log(this.itemsTarget)
  }

  send(event) {
    // console.log("update-my-book-card")
    // fetch(this.btnacceptTarget.action, {
    //   method: "POST",
    //   headers: { "Accept": "application/json" },
    //   // body: new FormData(this.formTarget)
    // })
    //   .then(response => response.json())
    //   .then((data) => {
    //     if (data.inserted_item) {
    //       this.itemsTarget.insertAdjacentHTML("beforebegin", data.inserted_item)
    //     }
    //     this.formTarget.outerHTML = data.form
    //   })
  }
}
