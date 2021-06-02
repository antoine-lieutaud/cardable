import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    placeholder: "Toutes les offres",
    allowClear: true
  });
};

export { initSelect2 };