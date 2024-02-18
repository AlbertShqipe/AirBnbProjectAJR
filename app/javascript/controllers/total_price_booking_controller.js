import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price-booking"
export default class extends Controller {


  static targets = ["startDate", "endDate", "price", "pricePerDay"];

  connect() {
    console.log('hello')
    console.log()
    console.log()
  }

  priceCount() {
    console.log('lol')
    let date1 = this.startDateTarget
    let date2 = this.endDateTarget
    let startDate = new Date(date1.value);
    let endDate = new Date(date2.value);
    let diffTime = Math.abs(endDate - startDate);
    let diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    console.log(diffDays + " days");
    let price = this.priceTarget
    console.log(this.pricePerDayTarget.innerText)
    price.innerText = diffDays * this.pricePerDayTarget.innerText
  }

}
