// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require social-share-button
//= require_tree .

var set_ratings = function(form_id, ratings){
  for(i = 1; i <= 5; i++){
    if(i <= ratings){
      $("#" + form_id + "_" + i).addClass("on");
    }else{
      $("#" + form_id + "_" + i).removeClass("on");
    }
  }
}

$(document).on("click", ".rating_star", function(){
  var rating = $(this);
  var form_id = $(this).attr("data-form-id");
  var ratings = $(this).attr("data-rating");

  set_ratings(form_id, ratings);

  $("#" + form_id).val(ratings);
});
