// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { initNavbar } from '../plugins/navbar';
import { scanQR } from '../plugins/scan_qr';
import { initSweetalert } from '../plugins/init_sweetalert';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initNavbar();
  scanQR();

  initSweetalert('#sweet-alert-demo', {
    title: "Valide",
    text: "Un menu, 2 personnes, genere le XX/XX/XXXX au nom de X \n il reste 2 utilisations",
    icon: "success",
    buttons: ["Annuler", "Utiliser le coupon"]
  }, (value) => {
    console.log(value);
  });

  initSweetalert('#sweet-alert-demo2', {
    title: "Non Valide",
    text: "A faire: if validate = true, return 'Ce coupon a deja ete utilise le XX/XX/XXXX' else 'ce coupon n'a jamais ete genere",
    icon: "error",
    buttons: "Retour"
  }, (value) => {
    console.log(value);
  });
});

import "controllers"


