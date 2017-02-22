$(function() {
  function buildHTML(message) {
    if (message.image) {
      var insertImage =`
      <br><img src="${message.image}">
      `;
    } else {
      var insertImage = '';
    }

    var html = `
      <li class="message">
        <div class="message__message-hedder">
          <p class="message__message-hedder__name">
            ${message.name}
          </p>
          <p class="message__message-hedder__time">
            ${message.time}
          </p>
        </div>
        <div class="message__body">
          <p class="body">
            ${message.body}
            ${insertImage}
          </p>
        </div>
      </li>
      `
    return html;
  }

//以下、メッセージ投稿機能に関する記述
  $('.new-message').on('submit', function(e) {
    e.preventDefault();
    var pathname = location.pathname;
    $('#send').removeAttr('data-disable-with');
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
      $('.main-body__main-posts').append(html);
      $('form')[0].reset();
    })
    .fail(function() {
      alert('投稿できませんでした。');
    });
  });

//以下、5秒ごとに自動更新する機能に関する記述
  setInterval(reload, 1000*5);
  var pathname = location.pathname;
  function reload(){
    $.ajax({
      type: 'GET',
      url: pathname,
      dataType: 'json'
    })
    .then(function(json) {
      if(json !== null){
        var insertHTML = '';
        json.forEach(function(message) {
          insertHTML += buildHTML(message);
        });
        $('.main-body__main-posts').append(insertHTML);
      };
    })
  };
});
