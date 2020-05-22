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
})