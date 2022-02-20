// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../bootstrap_js_files.js'
import '../stylesheets/application.scss'
import './modal.js'
import './style.js'
import './infinite_scroll.js'
import './conversations/toggle_window.js'
import './conversations/position_and_visibility.js'
import './conversations/conversation.js'
import '../channels/shared/conversation.js'
import './conversations/options.js'
import './contact_requests.js'
import '../channels/group/conversation_channel.js'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
