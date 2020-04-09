$(function(){ 
  function buildHTML(message){
   if ( message.image ) {
     var html =
     `<div class="message" data-message-id=${message.id}>
         <div class="upper-message">
           <div class="upper-message__user_name">
             ${message.user_name}
           </div>
           <div class="upper-message__date">
             ${message.created_at}
           </div>
         </div>
         <div class="lower-message">
           <p class="lower-message__content">
             ${message.content}
           </p>
         </div>
         <img src=${message.image} >
       </div>`
     return html;
   } else {
     var html =
     `<div class="message" data-message-id=${message.id}>
         <div class="upper-message">
           <div class="upper-message__user_name">
             ${message.user_name}
           </div>
           <div class="upper-message__date">
             ${message.created_at}
           </div>
         </div>
         <div class="lower-message">
           <p class="lower-message__content">
             ${message.content}
           </p>
         </div>
       </div>`
     return html;
   };
 }
 
 
 $('#new_message').on('submit', function(e){
  e.preventDefault();
  var formData = new FormData(this);
  var url = $(this).attr('action')
  $.ajax({
    url: url,
    type: "POST",
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false
  })
    .done(function(data){
      var html = buildHTML(data);
      $('.message-list').append(html);
      $('form')[0].reset();
      $('.message-list').animate({ scrollTop: $('.message-list')[0].scrollHeight});
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました");
    });
    $(".form__submit-btn").prop('disabled', false);
    $("#new_message")[0].reset();
 })

 //  自動更新
  var reloadMessages = function() {
    var last_message_id = $('.message:last').data("message-id");
    
    $.ajax({
      url: "api/messages",
      type: 'get',
      dataType: 'json',
      data: {id: last_message_id}
    })
    .done(function(messages) {
      if (messages.length !== 0) {
        var insertHTML = '';
        $.each(messages, function(i, message) {
          insertHTML += buildHTML(message)
        });
        $('.message-list').append(insertHTML);
        $('.message-list').animate({ scrollTop: $('.message-list')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('error');
    });
    $(".form__submit").prop("disabled", false);
  };
  if (document.location.href.match(/\/groups\/\d+\/messages/)) {
    setInterval(reloadMessages, 7000);
  }
});