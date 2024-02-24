import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-filters"
export default class extends Controller {

  static targets= ["tab","btn"]
  static values = {
    default: String,
    type: String
  }

  connect() {
      console.log('très con')
      console.log(this.defaultValue)

      this.tabTargets.forEach(tab => {
        console.log(this.defaultValue)
        if (tab.dataset.menuFiltersTypeValue !== this.defaultValue) {
          tab.classList.add('hidden');
        }
      });

  }

  filter(event) {
    event.preventDefault
    let btnId= event.currentTarget.dataset.id
    console.log(btnId)
    this.tabTargets.forEach(tab => {
      if (tab.dataset.menuFiltersTypeValue !== btnId)
        tab.classList.add('hidden')
      else
        tab.classList.remove('hidden')
    });
  }
}
