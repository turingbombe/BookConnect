
$(function(){
  postNewMessage();

});


function postNewMessage(){
$("form.new_message").on("ajax:success", function(e, response, status){
  debugger;
  $("#message_board").append($("#club_messages_content").val());
  $("#club_messages_content").val('');
  });
}

// $.ajax({
//   url: club_path,
//   data: {
//     content: 97201
//   },
//   success: function( result ) {
//     $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
//   }
// });


// $(".new_message").submit(function(event){
//   event.preventDefault();
//
//   $("#message_board").append($("#club_messages_content").val());
//   $("#club_messages_content").val('');
//   });
// });
