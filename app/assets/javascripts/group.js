$(function() {
  var list = $("#list");
  var preWord;
  var already_added_user = $('.added-user-name').text();

  function appendList(word,id) {
    if (word === '一致する人物はいませんでした。'){
      var item = $('<li class="list">').append(word);
    }else{
      var item = $(`<li class="list">${word}<input class="add-button", type="button", value="追加"><input type="hidden" value=${id}  class="uer-id-input">`);
    }
    list.append(item);
  }

  function editElement(element) {
    var result = "^" + element;
    return result;
  }

  $('#list').on('click', '.add-button', function(){
    var add_user = $(this).parent().text();
    var add_user_id = $(this).siblings('.uer-id-input').val();
    var user_name_list = $(`<div><li class="added-user-name">${add_user}<input class="delete-button", type="button", value="削除"><input type="hidden" name="group[user_ids][]" value=${add_user_id}  class="added-user-name_input">`);
    $('#added-user-name-space').append(user_name_list);
    $('.list').remove();
    $('#keyword').val("");
  });

  $('#added-user-name-space').on('click', '.delete-button', function(){
    $(this).parent().remove();
  });

  $("#keyword").on("keyup", function() {
    names = $('#keyword').val();
    $.ajax({
      type:'GET',
      url: '/users',
      data: {
        user:{
          name: names
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var inputs = names.split(" ").filter(function(e) { return e; });
      var newInputs = inputs.map(editElement);
      var word = newInputs.join("|");
      var reg = RegExp(word);
      if (word != preWord) {
        $(".list").remove();
        if(names.length !== 0) {
          $.each(data, function(i, ele) {
            var user_name = ele.name
            user_id = ele.id
            if (user_name.match(reg)) {
              appendList(user_name, user_id);
            }
          });
          if ($(".list").length === 0) {
            appendList('一致する人物はいませんでした。');
          }
        }
      }
    preWord = word;
    })
    .fail(function() {
    });
  });
});
