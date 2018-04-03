App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $(".message_content").val("");
    if ((($("#sender_id").val() == data.sender_id) && ($("#receiver_id").val() == data.receiver_id)) || (($("#sender_id").val() == data.receiver_id) && ($("#receiver_id").val() == data.sender_id)))
      $(".no_message_text").hide();
      $(".messages_body").prepend '<div class="row">' +
        '<div class="col col-sm-12 col-md-12">' +
        '<p><strong>' + data.username + '</strong>' +
        '<small>' + "  " + data.created_at + '</small></p>' +
        '<p>' + data.content + '</p>' +
        '</div></div>' +
        '<p class="horizontal_line"></p>'
