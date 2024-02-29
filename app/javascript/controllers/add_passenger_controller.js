import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  static values = { number_of_forms: Number }
  static targets = [ "add_button" ]

  connect() {
    this.number_of_forms = document.querySelectorAll("h3").length
  }

  add_form() {

  }

}