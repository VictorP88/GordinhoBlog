// counter_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["valor"]

  connect() {
    console.log("Conexão"); 
    this.valor = parseInt(this.valorTarget.textContent)
    console.log("Valor inicial:", this.valor);
  }

  incrementar() {
    console.log("Incrementar chamado"); 
    this.valor += 1
    this.atualizarValor()
  }

  decrementar() {
    console.log("Decrementar chamado"); 
    this.valor -= 1
    this.atualizarValor()
  }

  atualizarValor() {
    console.log("Valor atual:", this.valor); 
    this.valorTarget.textContent = this.valor
  }
}