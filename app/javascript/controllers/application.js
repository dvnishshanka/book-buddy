import { Application } from "@hotwired/stimulus"


// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// import Flatpickr
import Flatpickr from "stimulus-flatpickr"

application.register('flatpickr', Flatpickr)

export { application }
