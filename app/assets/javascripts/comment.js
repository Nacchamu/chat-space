$(function(){
  var href = location.pathname;
  var uname = $('.current_user_name').val();

    $('.comment-form').submit(function(e){
    e.preventDefault();
    e.stopImmediatePropagation();
    var form = $('.comment-form').get()[0];
    var formData = new FormData( form );
    $.ajax({
      type: 'POST',
      url: href,
      data: formData,
      processData: false,
      dataType: 'json',
      contentType: false
    })
    .done(function(data) {
      var user_comment = (`<p class="right-content__under-box__comment-box__comment">${data.comment}`)
      var datetime = (`<p class="right-content__under-box__comment-box__datetime">${data.date}`)
      var user_name = (`<p class="right-content__under-box__comment-box__user-name">${data.user}`)
      list_var = (`<div class="right-content__under-box__comment-box">${user_name}${datetime}${user_comment}`)
      $('.right-content__under-box').append(list_var);
      $('#for_flash').removeClass('alert');
      $('#for_flash').addClass('notice').text('送信に成功しました');
      $('.comment-form__box').val('');
      $('.comment-form__image').val('');
    })
    .fail(function() {
      $('#for_flash').remove('notice');
      $('#for_flash').addClass('alert').text('文章を入力してください');
    });
  });
});
