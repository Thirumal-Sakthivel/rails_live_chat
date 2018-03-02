$(document).ready ->
  $(".new_message").on("ajax:success", (e, data, status, xhr) ->
    $(".message_content").val("");
    $(".no_message_text").hide();
    alertify.success("Message sent");
  ).on "ajax:error", (e, xhr, status, error) ->
    alertify.error("Server error");