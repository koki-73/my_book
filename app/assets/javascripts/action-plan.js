$(function() {
  $(".count-area").css("display", "none");

  function completedStamp(dataId, level) {
    if (level == 5) {
      $(`.action-plan[data-id=${dataId}]`).css("color", "#aaa");
      $(`.action-plan[data-id=${dataId}]`).find(".completed-icon").css("display", "block");
    } else {
      $(`.action-plan[data-id=${dataId}]`).css("color", "#000");
      $(`.action-plan[data-id=${dataId}]`).find(".completed-icon").css("display", "none");
    }
  }

  $(".action-plan").each(function(i, e) {
    var dataId = e.dataset.id
    var level = $(`.action-plan[data-id=${dataId}]`).find("span.progress-level").text();
    level = parseInt(level);
    completedStamp(dataId, level)
  });

  $(".right-content").on("click", "#count-down", function() {
    var dataId = $(this).closest(".action-plan").data("id");
    var level = $(this).parent().parent().find("span.progress-level").text();
    level = parseInt(level) - 1;
    completedStamp(dataId, level);
  })

  $(".right-content").on("click", "#count-up", function() {
    var dataId = $(this).closest(".action-plan").data("id");
    var level = $(this).parent().parent().find("span.progress-level").text();
    level = parseInt(level) + 1;
    completedStamp(dataId, level);
  })

  $("#edit-progress-btn").on("click", function(){
    var value = $(".count-area").css("display");
    if (value == "flex") {
      $(this).text("レベルの変更");
      $(".count-area").css("display", "none");
    } else {
      $(this).text("終了");
      $(".count-area").css("display", "flex");
    }
  })

  $("#progress-question").on("click", function() {
    $(".progress-explain").fadeToggle(500);
  })
})