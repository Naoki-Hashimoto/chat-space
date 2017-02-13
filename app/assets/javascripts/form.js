$(function() {
  function buildHTML(message) {
    var user_name = $('<p class = "message__message-hedder__name">').append(data.name)
    var message_time = $('<p class = "message__message-hedder__time">').append(data.created_at)
    var message_body = $('<p class = "body">').append(data.body)
    var html = $('<li class = "message">').append(user_name, message_body, message_time);
    return html;
  }

  $('.new-message').on('submit', function(e) {
    e.preventDefault();
    var pathname = location.pathname;
    var formData = new FormData($(this).get(0));
    $.ajax({
      type: 'POST',
      url: pathname,
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('#message_body').val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
