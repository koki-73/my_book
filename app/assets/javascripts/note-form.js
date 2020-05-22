$(function(){
  function buildFileField(index) {
    const html = `<div class="js-file-group" data-index="${index}">
                    <div class="summary-border"></div>
                    <h3 class="input-area-title">見出し</h3>
                    <input placeholder="見出しを入力してください" class="summary-title-field" type="text" name="note[summaries_attributes][${index}][title]" id="note_summaries_attributes_${index}_title">
                    <h3 class="input-area-title">要約</h3>
                    <textarea placeholder="概要を入力してください" class="summary-content-field" name="note[summaries_attributes][${index}][content]" id="note_summaries_attributes_${index}_content"></textarea>
                    <div class="delete-form-display">削除する</div>
                    <div class="delete-form-btn"></div>
                  </div>`;
    return html;
  }

  let fileIndex = [1, 2, 3, 4]
  lastIndex = $(".js-file-group:last").data("index");
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
  if (fileIndex.length == 0) $(".add-form-btn").css("display","none");

  $(".add-form-btn").on("click", function() {
    $(".summary-form-area").append(buildFileField(fileIndex[0]));
    let index = fileIndex[0] + 1
    fileIndex.shift();
    if (fileIndex.length == 0) $(".add-form-btn").css("display","none");
    console.log(fileIndex)
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
    if (hiddenCheck) {
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
    console.log(fileIndex)
    if (fileIndex.length == 5) $(".summary-form-area").append(buildFileField(fileIndex[0]));
  })
})