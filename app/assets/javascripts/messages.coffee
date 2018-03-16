$(document).ready ->
  $(".new_message").on("ajax:success", (e, data, status, xhr) ->
    $(".message_content").val("");
    alertify.success("Message sent");
  ).on "ajax:error", (e, xhr, status, error) ->
    alertify.error("Server error");