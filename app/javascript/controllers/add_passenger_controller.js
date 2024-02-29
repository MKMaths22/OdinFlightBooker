import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  static values = { number_of_forms: Number }
  static targets = [ "add_button" ]

  connect() {
    this.number_of_forms = document.querySelectorAll("h3").length
  }

  correct_string(string) {
    string.replace("X", `${this.number_of_forms}`)
    // Haven't managed to call this function within add_form because of scope issues? 
    // Will put off trying to fix this for now.
  }

  add_form() {
    const passenger_details = document.querySelector("div.passengersdetailsdiv");
    const template = document.querySelector("#onepassenger");
    const clone = template.content.cloneNode(true);
    const first_label = clone.querySelector("label.namelabel");
    const first_for_string = first_label.getAttribute("for");
    console.log(first_for_string)
    // first_label.setAttribute
    this.number_of_forms++;
    const headline = clone.querySelector("h3");
    headline.textContent = headline.textContent.replace("X", `${this.number_of_forms}`)
    passenger_details.appendChild(clone)
  }
}