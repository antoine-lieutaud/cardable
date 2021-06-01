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
    title: "hello",
    text: "Formule: XXXX\nnombre de personnes: X\ndate de creation: XX/XX/XXXX\ndate d'expiration: XX/XX/XXXX\nPre\n il reste 2 utilisations",
    icon: "success",
    buttons: ["Annuler", "Utiliser le coupon"]
  }, (value) => {
    console.log(document.querySelector("#vouchersummit"))
    document.querySelector("#vouchersummit").click();
  });


});

import "controllers"


