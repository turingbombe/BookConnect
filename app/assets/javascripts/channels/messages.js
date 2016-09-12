App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    //$("#messages").removeClass('hidden');
    return $('#message_board').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
