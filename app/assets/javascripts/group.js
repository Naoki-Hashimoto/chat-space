$(function() {
  function insertHTML(user) {
    var html = `
      <div class="chat-group-form__chat-group-user search ">
        <p class="chat-group-form__chat-group-user__name">
          ${user.name}
        </p>
        <a id="add_btn" class="chat-group-form__chat-group-user__btn">
          <p class="chat-group-form__chat-group-user__btn--add">追加</p>
        </a>
      </div>
      `
    return html;
  }

  $('#user-search-field').on('keyup', function(e) {
    var input = $.trim($(this).val());
    $.ajax({
      type: 'GET',
      url: '/users.json',
      data: { name: input }
    })

    .then(function(users) {
      $(".search").remove();
      users.forEach(function(users){
        var html = insertHTML(users);
        $('#user-search-result').append(html);
      });
      if(input.length == 0){
        $(".search").remove();
      }
    })
  });

  // $('#add_btn').on('click', function(e) {
  // })
});
