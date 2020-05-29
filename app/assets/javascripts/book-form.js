$(function(){
  const buildImg = (url)=> {
    const html = `<img class="book-image" src="${url}" >`;
    return html;
  }
  
  $("#book-image-form").on("change", function(e){
    $("img").remove();
    $(".no-image").remove();
    const blobUrl = window.URL.createObjectURL(e.target.files[0]);
    $("#book-image-preview label#book-image").append(buildImg(blobUrl));
  })
})