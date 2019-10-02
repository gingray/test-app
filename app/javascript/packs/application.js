/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import $ from 'jquery'
import 'bootstrap-datepicker/js/bootstrap-datepicker.js'
import 'bootstrap/dist/js/bootstrap'


$(document).ready(() =>{
  $.ajaxSetup({
    headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
  });

  $('#retrieve-form').submit((evt) => {
    const data = {
      start_date: $('input.start-date').val(),
      end_date: $('input.end-date').val(),
      currency: $('select.currency').val()
    };
    const url = $(evt.target).attr('action');
    $.ajax(url, {
      method: 'POST',
      data: data,
      success: (data) => {
        console.log(data);
    },
      error: (data) => {
        let msg = null;
        if (data.status === 401) {
          msg = 'Need to auth dude'
        } else {
          msg = data.responseJSON['msg'];
        }
        const html = `<div class="alert alert-warning alert-dismissible fade show" role="alert">
   ${msg}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>`;

        $('.error-msg').append($(html))
      }
    });
    evt.preventDefault();
  })
})
console.log('Hello World from Webpacker')
