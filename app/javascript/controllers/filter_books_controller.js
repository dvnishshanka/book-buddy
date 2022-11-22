import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-books"
export default class extends Controller {


  static targets = ["button", "allBooks", "book"];
  connect() {
    console.log("lets goooooo")
    console.log(this.bookTargets.filter)
    console.log(this.classList)
    // console.log(this.listTarget)
   }


  filter(event) {
    this.buttonTargets.forEach((button) => {
      button.classList.remove("selected");
    });
    this.bookTargets.forEach((book) => {
      book.classList.remove("hide");
    });
    event.target.classList.add("selected");
    this.allBooksTarget.classList.remove("selected");
    this.bookTargets.filter((item) => {
      if (!item.innerHTML.includes(event.target.innerHTML)) {
        item.classList.add("hide");
      }
    });
  }

  clearFilter() {
    this.allBooksTarget.classList.add("selected");
    this.buttonTargets.forEach((button) => {
      button.classList.remove("selected");
    });
    this.bookTargets.forEach((book) => {
      book.classList.remove("hide");
    });
  }
}
