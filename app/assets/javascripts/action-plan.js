$(function() {
  $(".count-area").css("display", "none");

  $("#edit-progress-btn").on("click", function(){
    var value = $(".count-area").css("display")
    if (value == "flex") {
      $(this).text("レベルの変更")
      $(".count-area").css("display", "none");
    } else {
      $(this).text("終了")
      $(".count-area").css("display", "flex");
    }
  })

  $("#progress-question").on("click", function() {
    $(".progress-explain").fadeToggle(500);
  })

})