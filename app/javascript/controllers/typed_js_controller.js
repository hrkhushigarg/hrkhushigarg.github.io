// app/javascript/controllers/typed_js_controller.js
import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Hello! I am your personal"],
      typeSpeed: 50,
      loop: false
    })
  }
}
