// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require highcharts
//= require chartkick
//= require_tree ./channels
//= require_tree .


// $(document).ready(function() {
//   $("#new_message").on("ajax:complete", function(e, request, status) {
//     var response= request.responseJSON;
//       $("#message_board").append("<p> On " + response.date + ": " + response.user.name + " said \"" + response.content + "\" </p>");
//   });
// });

$(document).ready(function() {
  $("#delete_button").bind("click", confirmDelete);
});

function confirmDelete(event){
  if (!confirm("Are you sure you want to delete your profile?")) {
      event.preventDefault();
    }
    return true;
}

function clearMessage(){
  $("#new_message").submit(function(event){
    $("#new_message").textarea.val("");
  });
}



// function confirmDelete(event){
//   event.stopPropagation();
//   if(confirm("Are you sure you want to delete your profile?")) {
//    this.click;
//       alert("Ok");
//   }
//   else
//   {
//       alert("Cancel");
//   }
//   event.preventDefault();
//
// }
