import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  static values = { number_of_forms: Number }
  static targets = [ "add_button" ]

  connect() {
    this.number_of_forms = document.querySelectorAll("h3").length
  }

  // correct_string(string) {
  //   string.replace("X", `${this.number_of_forms}`)
    // Haven't managed to call this function within add_form because of scope issues? 
    // Will put off trying to fix this for now.
  // }

  add_form() {
    const correct_string = function(string, number) {
      string.replace("X", `${number.to_s}`)
    };
    const passenger_details = document.querySelector("div.passengersdetailsdiv");
    const template = document.querySelector("#onepassenger");
    const clone = template.content.cloneNode(true);

    const first_label = clone.querySelector("label.namelabel");
    let old_stuff = first_label.getAttribute("for");
    // let new_attribute = old_stuff.replace("X",`${this.number_of_forms}`)
    let new_attribute = correct_string(old_stuff, this.number_of_forms);
    first_label.setAttribute("for", `${new_attribute}`)
    const first_name = clone.querySelector("input.nameinput");
    first_name.setAttribute("id", `${new_attribute}`)
    old_stuff = first_name.getAttribute("name");
    new_attribute = old_stuff.replace("X", `${this.number_of_forms}`)
    first_name.setAttribute("name", `${new_attribute}`)


    this.number_of_forms++;
    const headline = clone.querySelector("h3");
    headline.textContent = headline.textContent.replace("X", `${this.number_of_forms}`)
    passenger_details.appendChild(clone)
  }
}