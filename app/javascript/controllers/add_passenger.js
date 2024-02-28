import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  static values = { number_of_forms: Number }
  static targets = [ "add_button" ]

  connect() {
    this.number_of_forms = document.querySelectorAll("h3").size
    console.log(5)
    /* Even this simple console.log command isn't doing anything. Yet I have stimulus in the Gemfile and have run bundle install and rails stimulus:install. What have I missed? Is Stimulus not installed? If it is, why does this simple command not put '5' in the console when I load the new booking form page, where the div is located with data-controller="add_passenger". Do I need to do more to connect an instance of this controller?
    /* console.log(this.number_of_forms) */
  }

  add_form() {

  }

}