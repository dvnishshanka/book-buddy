import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buttons"
export default class extends Controller {
  static targets = ["icon", "outerlayer","educationIcon", "horrorIcon", "romanceIcon" , "scifiIcon", "poetryIcon", "fictionIcon", "allIcon", "travelIcon" , "crimeIcon", "comedyIcon"]
  connect() {
    // this.outerlayerTarget.style.backgroundColor = "red"
    // this.iconTarget.style.color = "blue"
    this.url = document.URL.split("")
    this.equalSign = this.url.indexOf("=")
    this.category = this.url.slice(this.equalSign +1, this.url.length).join("")

    console.log(this.category )

    if(this.category === "allbooks") {
      this.allIconTarget.style.color = "#EF814E"
    } else if(this.category === "horror") {
      this.horrorIconTarget.style.color = "#DD1C1A"
    }else if (this.category === "sci-fi") {
      this.scifiIconTarget.style.color = "#197BBD"
    } else if (this.category === "poetry") {
      this.poetryIconTarget.style.color = "#828489"
    } else if (this.category === "fiction") {
        this.fictionIconTarget.style.color = "#DB8A74"
    }else if (this.category === "education") {
      this.educationIconTarget.style.color = "#559CAD"
    }else if (this.category === "romance") {
        this.romanceIconTarget.style.color = "#E83F6F"
    }else if (this.category === "crime") {
        this.crimeIconTarget.style.color = "#F42C04"
    }else if (this.category === "travel") {
      this.travelIconTarget.style.color = "#4EA699"
    }else if (this.category === "comedy") {
        this.comedyIconTarget.style.color = "#FE5D26"
  }

  }





}
