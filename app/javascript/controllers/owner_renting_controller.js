import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="owner-renting"
export default class extends Controller {
  static targets = ["button"];
  connect() {

    // Retrieve user_id and owner_id from data attributes
    this.userId = this.element.dataset.userId;
    this.playerOwnerId = this.element.dataset.ownerId;
    console.log("User ID:", this.userId);
    console.log("Player Owner ID:", this.playerOwnerId);

    // Check if the user is the owner, and disable booking if true
    // if (this.userId === this.playerOwnerId) {
      // Disable booking functionality here
      // console.log("User is the owner. Booking functionality disabled.");
      // For example, you might disable a button or hide a booking form
    // } else {
      // Enable booking functionality here
      // console.log("User is not the owner. Booking functionality enabled.");
      // For example, you might enable a button or show a booking form
    // }

    // Check if the user is the owner, and disable booking if true
    if (this.userId === this.playerOwnerId) {
      const button = document.getElementById("bookButton");
      button.disabled = true;
      button.value = "This player is yours"
    }
  }
}
