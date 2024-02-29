import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  static values = { number_of_forms: Number }
  static targets = [ "add_button" ]

  connect() {
    this.number_of_forms = document.querySelectorAll("h3").length
  }

  add_form() {
    const passenger_details = document.querySelector("div.passengersdetailsdiv");
    const template = document.querySelector("#onepassenger");
    const clone = template.content.cloneNode(true);
    
    this.number_of_forms++;
    const headline = clone.querySelector("h3");
    headline.textContent = `Details for Passenger ${this.number_of_forms}`
    passenger_details.appendChild(clone)
  }

}