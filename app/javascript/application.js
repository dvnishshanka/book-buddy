// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "stimulus-flatpickr"
import "stimulus-read-more"

window.bootstrap = bootstrap


// const button = document.querySelector('.filter-button');
// button.addEventListener('click', () => {
//     const element = document.querySelector('.filter-button');
//     element.style.backgroundColor = 'red';
// });

// let testButton = document.getElementById("testbutton");

// testButton.addEventListener("click", () => {
//   testButton.classList.toggle('clicked');
// })

// (document).ready(function(){
//   ("#myBtn").click(function(){
//     ("#myModal").modal();
//   });
// });

// var count = 1;
// function setColor(btn, color) {
//     var property = document.getElementById('id1');
//     if (count == 0) {
//         property.style.backgroundColor = "#FFFFFF"
//         count = 1;
//     }
//     else {
//         property.style.backgroundColor = "#7FFF00"
//         count = 0;
//     }
// }
