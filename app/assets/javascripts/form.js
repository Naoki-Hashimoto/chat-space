$(function() {
  function buildHTML(message) {
    var html =`
      <li class="message">
        <div class="message__message-hedder">
          <p class="message__message-hedder__name">
            ${gon.user_name}
          </p>
          <p class="message__message-hedder__time">
            ${message.created_at}
          </p>
        </div>
        <div class="message__body">
          <p class="body">
            ${message.body}
          </p>
        </div>
      </li>
      `
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
