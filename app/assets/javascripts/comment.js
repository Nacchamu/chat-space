$(function(){
  var href = location.pathname;
  var uname = $('.current_user_name').val();

  function buildHTML(data){
    $('.right-content__under-box').append('<div class="right-content__under-box__comment-box" data-id=' + data.id + '>' + '<p class="right-content__under-box__comment-box__user-name">' + data.user +'<p class="right-content__under-box__comment-box__datetime">' + data.date + '<p class="right-content__under-box__comment-box__comment">' + data.comment);
  }

  $(function(){
    setInterval(function(){
      $.ajax({
        type: 'GET',
        url: href,
        data: '',
        dataType: 'json'
      })
      .done(function(data){
        var db_comment_id = data.id
        var view_comment_id = $('.right-content__under-box__comment-box').last(1).data('id');
        if(db_comment_id != view_comment_id){
          $.ajax({
            type: 'POST',
            url: href + '/search',
            data:{
              view_id: view_comment_id
            },
            dataType: 'json'
          })
        .done(function(data){
          $(data).each(function(index, ele){
            buildHTML(ele);
          })
          view_comment_id = db_comment_id
        })
        .fail(function(){
        })
        }
      })
      .fail(function(){
      })
    },10000);
  });

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
      buildHTML(data);
      $('#for_flash').removeClass('alert');
      $('#for_flash').addClass('notice').text('送信に成功しました');
      $('.comment-form__box').val('');
      $('.comment-form__image').val('');
    })
    .fail(function() {
      $('#for_flash').remove('notice');
      $('#for_flash').addClass('alert').text('文章を入力してください');
    })
  });
});
