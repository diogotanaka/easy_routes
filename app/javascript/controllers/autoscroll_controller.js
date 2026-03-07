import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  scroll() {
    console.log("scroll executou")
    this.element.scrollTop = this.element.scrollHeight
  }
}
