import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-my-book-card"
export default class extends Controller {
  static targets = ["items", "btnaccept", "btnreject"]

  connect() {
    // console.log("dashboard controller")
    // console.log(this.itemsTarget)
    // console.log(this.btnrejectTarget)
    // // console.log(this.btnacceptTarget)
    // console.log(this.btnrejectTarget.href);
  }

  scrollTo(event) {
    // console.log("update-my-book-card")
    // console.log(event.target.href)
//     dataAccepted = {status: "ACCEPTED"}
//     event.preventDefault()
//     fetch(this.btnacceptTarget.href, {
//       method: "PATCH",
//       headers: { "Accept": "application/json" },
//       body: JSON.stringify.dataAccepted
//     })
//       .then(response => response.json())
//       .then((data) => {
//         if (data.inserted_item) {
//           console.log("identify")
//           // this.itemsTarget.insertAdjacentHTML("beforebegin", data.inserted_item)
//         }
//         // this.formTarget.outerHTML = data.form
//       })

dataRejected= {status: "REJECTED"}
      fetch(this.btnrejectTarget.href, {
        method: "PATCH",
        headers: { "Accept": "application/json" },
        body: JSON.stringify.dataRejected
      })
        .then(response => response.json())
        .then((data) => {

            console.log("identify", data)
            // this.itemsTarget.insertAdjacentHTML("beforebegin", data.inserted_item)
          }
          // this.formTarget.outerHTML = data.form
        )
  }

  scrollToo(event){
    // event.preventDefault();
    console.log(event)
    console.log(event.target)

    event.target.scrollTo(0, event.target.scrollHeight)
  }
}
