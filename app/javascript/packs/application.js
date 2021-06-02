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
import { initSelect2 } from '../plugins/init_select2';
import { initSweetalert } from '../plugins/init_sweetalert';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initNavbar();
  scanQR();
  initSelect2();

  initSweetalert('#sweet-alert-demo', {
    title: "Êtes-vous sûr de vouloir utiliser ce coupon ?",
    icon: "warning",
    buttons: ["Annuler", "Utiliser"]
  }, (value) => {
    if (value){
      document.querySelector("#vouchersummit").click();
    }
  });

  initSweetalert('#sweet-alert-demo2', {
    title: "Votre coupon a bien été créé",
    icon: "success",
    buttons: "OK"
  }, (value) => {
    console.log(document.querySelector("#vouchercreated"))
    document.querySelector("#vouchercreated").click();
  });

  initSweetalert('#sweet-alert-demo3', {
    title: "L'offre a bien ete creee",
    icon: "success",
    buttons: "Retour a mes offres"
  }, (value) => {
    console.log(document.querySelector("#offercreated"))
    document.querySelector("#offercreated").click();
  });
});

import "controllers"


