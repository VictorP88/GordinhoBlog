import { Application } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails"
import CounterController from "./controllers/counter_controller"; // Verifique o caminho correto

const application = Application.start();
application.register("counter", CounterController);