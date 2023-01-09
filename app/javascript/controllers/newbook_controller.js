import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="newbook"
export default class extends Controller {

  static targets = ["input", "books"]

  connect() {
    console.log("Connected to newbook controller")
  }

  send(event){
    console.log("Input field value",event.target.value);
    let search = event.target.value

    fetch(`https://www.googleapis.com/books/v1/volumes?q=${search}&langRestrict=en&key=AIzaSyB0fBuVdMBemt9qqtw4U9uDwzGUptI-SOk`)
      .then(data => {
      return data.json();
      })
      .then(post => {
      console.log(post["items"]);
      });

    // fetch(this.formTarget.action, {
    //   method: "POST",
    //   headers: { "Accept": "application/json" },
    //   body: new FormData(this.formTarget)
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
