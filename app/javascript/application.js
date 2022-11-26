// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "stimulus-flatpickr"
import "stimulus-read-more"
import  "jquery"



// const ribbonText = document.querySelector('.ribbonText');
// const ribbonContainer = document.querySelector('.ribbon');

// function resize_to_fit() {
//   let fontSize = window.getComputedStyle(ribbonText).fontSize;
//   ribbonText.style.fontSize = (parseFloat(fontSize) - 1) + 'px';
// console.log(fontSize)

// }

// // if(ribbonText.clientHeight >= ribbonContainer.clientHeight){
//   resize_to_fit();

// const para = document.querySelector('h6');
// const compStyles = window.getComputedStyle(para);
// para.textContent = `My computed font-size is ${compStyles.getPropertyValue('font-size')},\n` +
//   `and my computed line-height is ${compStyles.getPropertyValue('line-height')}.`;
