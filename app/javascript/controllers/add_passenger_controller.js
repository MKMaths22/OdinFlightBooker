import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  static targets = [ "add_button", "remove_button" ]

  // correct_string(string) {
  //   string.replace("X", `${this.number_of_forms}`)
    // Haven't managed to call this function within add_form because of scope issues? 
    // Will put off trying to fix this for now.
  // }

  add_form() {
    // const correct_string = function(string, number) {
    //  string.replace("X", `${number.to_s}`)
    //};
    let number_of_forms = document.querySelectorAll("div.onepassengerdiv").length
    const passenger_details = document.querySelector("div.passengersdetailsdiv");
    const template = document.querySelector("#onepassenger");
    const clone = template.content.cloneNode(true);

    let first_label = clone.querySelector("label.namelabel");
    let old_stuff = first_label.getAttribute("for");
    let new_attribute = old_stuff.replace("X",`${number_of_forms}`)
    // let new_attribute = correct_string(old_stuff, this.number_of_forms);
    first_label.setAttribute("for", `${new_attribute}`)
    let first_name = clone.querySelector("input.nameinput");
    first_name.setAttribute("id", `${new_attribute}`)
    old_stuff = first_name.getAttribute("name");
    new_attribute = old_stuff.replace("X", `${number_of_forms}`)
    first_name.setAttribute("name", `${new_attribute}`)

    first_label = clone.querySelector("label.emaillabel");
    old_stuff = first_label.getAttribute("for");
    new_attribute = old_stuff.replace("X",`${number_of_forms}`)
    // let new_attribute = correct_string(old_stuff, this.number_of_forms);
    first_label.setAttribute("for", `${new_attribute}`)
    first_name = clone.querySelector("input.emailinput");
    first_name.setAttribute("id", `${new_attribute}`)
    old_stuff = first_name.getAttribute("name");
    new_attribute = old_stuff.replace("X", `${number_of_forms}`)
    first_name.setAttribute("name", `${new_attribute}`)
    number_of_forms++;
    console.log(number_of_forms);
    const headline = clone.querySelector("h3");
    headline.textContent = headline.textContent.replace("X", `${number_of_forms}`);
    passenger_details.appendChild(clone);
    const para = document.querySelector("p.toppara");
    para.textContent = para.textContent.replace(`${number_of_forms - 1}`, `${number_of_forms}`)
    // the value of params would only change with a redirect, so we have to modify the 'You are making a booking for...' message here
    let address = window.location.href;
    address = address.replace(`passengers=${number_of_forms - 1}`, `passengers=${number_of_forms}`)
    window.history.pushState(null, "", address);
  }

  remove_form() {
    let number_of_forms = document.querySelectorAll("div.onepassengerdiv").length
    if (number_of_forms == 1) {
      return
    }
    else {
      const the_button_clicked = this.remove_buttonTarget;
      the_button_clicked.parentElement.parentElement.remove();
      number_of_forms--;
      console.log(number_of_forms);
    }
  }
}