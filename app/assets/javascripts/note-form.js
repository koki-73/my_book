$(function(){

  // summaryのフォーム追加・削除
  function buildSummaryFileField(index) {
    const html = `<div class="js-file-group" data-index="${index}">
                    <div class="input-area-title">
                      <h3 class="form-title">タイトル</h3>
                      <span class="form-require">必須</span>
                    </div>
                    <input placeholder="ポイントを一言で記入しましょう" class="summary-title-field" type="text" name="note[summaries_attributes][${index}][title]" id="note_summaries_attributes_${index}_title">
                    <div class="input-area-title">
                      <h3 class="form-title">説明</h3>
                    </div>
                    <textarea placeholder="説明を記入しましょう" class="summary-content-field" name="note[summaries_attributes][${index}][content]" id="note_summaries_attributes_${index}_content"></textarea>
                    <div class="delete-form-display">削除する</div>
                    <div class="delete-form-btn"></div>
                  </div>`;
    return html;
  }

  let fileIndex = [1, 2, 3, 4]
  lastIndex = $(".js-file-group:last").data("index");
  fileIndex.splice(0, lastIndex);
  let fileCount = 5 - fileIndex.length
  $('.hidden-destroy').hide();
  if (fileIndex.length == 0) $(".add-form-btn").css("display","none");

  $(".add-form-btn").on("click", function() {
    $(".summary-form-area").append(buildSummaryFileField(fileIndex[0]));
    fileIndex.shift();
    if (fileIndex.length == 0) $(".add-form-btn").css("display","none");
  })

  $(".summary-form-area").on("click", ".delete-form-display", function() {
    const deleteBtn = $(this).next();
    $('#overlay').fadeIn();
    $("#modal-close-btn").on("click", function() {
      $('#overlay').fadeOut();
    })
    $("#delete-comformation-btn__form").on("click", function() {
      deleteBtn.click();
      $('#overlay').fadeOut();
    })
  })
  $(".summary-form-area").on("click", ".delete-form-btn", function() {
    $(".add-form-btn").css("display","inline-block");
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    var lastIndex = $(".js-file-group:last").data("index");
    if (targetIndex < fileCount) {
      $(this).parent().css("display","none")
      hiddenCheck.prop('checked', true);
    } else {
      $(this).parent().remove();
    }
    if (fileIndex.length >= 1) {
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    } else {
      fileIndex.push(lastIndex + 1);
    }
    if (fileIndex.length == 5) $(".summary-form-area").append(buildSummaryFileField(fileIndex[0]));
  })

  // action_planのフォーム追加・削除
  function buildActionPlanFileField(index) {
    const html = `<div class="js-file-group-ap" data-index="${index}">
                    <input placeholder="実践したいことなどを記入しましょう" class="action-plan-field" type="text" name="note[action_plans_attributes][${index}][content]" id="note_action_plans_attributes_${index}_content">
                    <input value="1" type="hidden" name="note[action_plans_attributes][${index}][user_id]" id="note_action_plans_attributes_${index}_user_id">
                    <span class="delete-form-display">
                      <i class="fas fa-times-circle"></i>
                    </span>
                    <div class="delete-form-btn"></div>
                  </div>`;
    return html;
  }

  let actionPlanFileIndex = [1, 2, 3, 4]
  lastActionPlanIndex = $(".js-file-group-ap:last").data("index");
  actionPlanFileIndex.splice(0, lastActionPlanIndex);
  let actionPlanFileCount = 5 - actionPlanFileIndex.length

  $(".add-ap-form-btn").on("click", function() {
    $(".action-plan-form-area").append(buildActionPlanFileField(actionPlanFileIndex[0]));
    actionPlanFileIndex.shift();
    if (actionPlanFileIndex.length == 0) $(".add-ap-form-btn").css("display","none");
  })

  $(".action-plan-form-area").on("click", ".delete-form-display", function() {
    const deleteBtn = $(this).next();
    $('#overlay').fadeIn();
    $("#modal-close-btn").on("click", function() {
      $('#overlay').fadeOut();
    })
    $("#delete-comformation-btn__form").on("click", function() {
      deleteBtn.click();
      $('#overlay').fadeOut();
    })
  })
  $(".action-plan-form-area").on("click", ".delete-form-btn", function() {
    $(".add-ap-form-btn").css("display","inline-block");
    const targetActionPlanIndex = $(this).parent().data('index')
    const hiddenActionPlanCheck = $(this).parent().children(`input[data-index="${targetActionPlanIndex}"].hidden-destroy`);
    var lastActionPlanIndex = $(".js-file-group-ap:last").data("index");
    if (targetActionPlanIndex < actionPlanFileCount) {
      $(this).parent().css("display","none")
      hiddenActionPlanCheck.prop('checked', true);
    } else {
      $(this).parent().remove();
    }
    if (actionPlanFileIndex.length >= 1) {
      actionPlanFileIndex.push(actionPlanFileIndex[actionPlanFileIndex.length - 1] + 1);
    } else {
      actionPlanFileIndex.push(lastActionPlanIndex + 1);
    }
    if (actionPlanFileIndex.length == 5) $(".action-plan-form-area").append(buildActionPlanFileField(actionPlanFileIndex[0]));
  })

})