// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery

import "@hotwired/turbo-rails"
import "controllers"

$(document).on('turbo:load', function(e) {
  debugger
	hideShowAddress();
});

function hideShowAddress() {
  $('#address_details').on('change', function(e) {
    $('.address-details-div').toggleClass("d-none");
    if($("#lblShowHide").text() == "Hide Address Details")
      $("#lblShowHide").text("Show Address Details")
    else
      $("#lblShowHide").text("Hide Address Details")  
  });
}
