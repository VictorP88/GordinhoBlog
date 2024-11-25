import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["countValue"];

    connect() {
        this.count = parseInt(this.countValueTarget.textContent) || 0;
    }

    increment() {
        this.count += 1;
        this.updateCount();
    }

    decrement() {
        this.count -= 1;
        this.updateCount();
    }

    updateCount() {
        this.countValueTarget.textContent = this.count;
    }
}