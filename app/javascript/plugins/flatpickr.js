import flatpickr from "flatpickr";


// flatpickr(".datepicker", {});

document.addEventListener('turbolinks:load', () => {
  flatpickr(".datepicker", {
    static: true,
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d"
  })
});
