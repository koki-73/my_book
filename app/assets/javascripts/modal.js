$(function() {
  // ノート削除用
  $("#delete-note-link").on("click", function() {
    $('#overlay').fadeIn();
    $("#modal-close-btn").on("click", function() {
      $('#overlay').fadeOut();
    })
    $("#delete-comformation-btn__note").on("click", function() {
      $('#delete-note-btn')[0].click();
    })
  })

  // notes#indexの登録用
  $("#book-register-link").on("click", function() {
    $('#overlay').fadeIn();
    $("#modal-close-btn").on("click", function() {
      $('#overlay').fadeOut();
    })
  })

  // users#showの更新用
  $(".update-book-status-link").on("click", function() {
    var dataId = $(this).data("id");
    $(`.overlay[data-id=${dataId}]`).fadeIn();
    $(".modal-close-btn").on("click", function() {
      $('.overlay').fadeOut();
    })
  })
})