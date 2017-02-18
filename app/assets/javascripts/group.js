$(function() {
// 以下、検索結果の表示に関する記述
  function insertHTML(user) {
    var html = `
      <div class="chat-group-form__chat-group-user search">
        <p class="chat-group-form__chat-group-user__name">
          ${user.name}
        </p>
        <a id= "add_btn" class="chat-group-form__chat-group-user__btn" data-user-name="${user.name}" data-user-id="${user.id}">
          <p class="chat-group-form__chat-group-user__btn--add">追加</p>
        </a>
      </div>
      `
    return html;
  }
// 以下、追加されたチャットメンバー欄の表示に関する記述
  function addUserHTML(user_name, user_id){
    var html = `
      <div class="chat-group-form__chat-group-user">
        <input value="${user_id}" type="hidden" name="group[user_ids][]" id="group_user_ids_${user_id}">
        <p class="chat-group-form__chat-group-user__name">
          ${user_name}
        </p>
        <a id="remove_btn" class="chat-group-form__chat-group-user__btn">
          <p class="chat-group-form__chat-group-user__btn--remove">削除</p>
        </a>
      <div>
      `
    return html;
  }

// 以下、user検索欄に入力後の挙動に関する記述
  $('#user-search-field').on('keyup', function(e) {
    var input = $.trim($(this).val());
    $.ajax({
      type: 'GET',
      url: '/users.json',
      data: { name: input }
    })

    .then(function(users) {
        $(".search").remove();
          users.forEach(function(user){
            if ( String(user.id) !== $("#group_user_ids_" + user.id).val() ) {
              var html = insertHTML(user);
              $('#user-search-result').append(html);
            }
          });
        // 以下、検索欄が空の時に検索結果を削除するための記述
        if(input.length == 0){
          $(".search").remove();
        }
    })
  });

// 以下、追加ボタンの挙動に関する記述
  $('#user-search-result').on('click', '#add_btn', function(e) {
    var user_name =  $(this).data('userName'),
        user_id =  $(this).data('userId'),
        html = addUserHTML(user_name, user_id);
        $('#user-add-result').append(html);
    $(this).parent().remove();
  })

// 以下、削除ボタンの挙動に関する記述
  $('#user-add-result').on('click', '#remove_btn', function(e) {
    $(this).parent().remove();
  })
});

