$(function(){
  // ページ読み込み時にテキストエリアの高さを中身に応じて変更
  $(".summary-content-field").each(function(index, element){
    $(`#note_summaries_attributes_${index}_content`).prev().text($(element).text() + "\u200b")
  })
  let reviewText = $(".review-field").text();
  let memoText = $(".memo-field").text();
  $(".review-field__dummy").text(reviewText + "\u200b")
  $(".memo-field__dummy").text(memoText + "\u200b")

  // フォームに入力する時にテキストエリアの高さを中身に応じて変更
  $(".summary-form-area").on("input", ".summary-content-field", function(e) {
    $(this).prev().text(e.target.value + "\u200b") 
  })
  
  $(".review-field").on("input", function(e) {
    $(".review-field__dummy").text(e.target.value + "\u200b") 
  })

  $(".memo-field").on("input", function(e) {
    $(".memo-field__dummy").text(e.target.value + "\u200b") 
  })

})