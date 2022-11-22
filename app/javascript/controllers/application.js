import { Application } from "@hotwired/stimulus"

import ReadMore from 'stimulus-read-more'
// import Popover from 'stimulus-popover'

const application = Application.start()
application.register('read-more', ReadMore)
// application.register('popover', Popover)


// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
