// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require rails-ujs
//= require toastr

import "@hotwired/turbo-rails"
import "controllers"

$(document).on('turbo:load', function(e) {
	hideShowAddress();
  changeCategory();
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

function changeCategory() {
  $('.category-dropdown').on('change', function(e) {
    var categoryName = $(this).val();
    debugger

    $.ajax({
      url: '/shoppingcart/product_list',
      method: 'get',
      data: {
        category: categoryName
      }
    });
    e.stopImmediatePropagation();

  })
}
