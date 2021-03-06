$(function(){

  var search_list = $(".book-index");

  function appendBook(book) {
    var html = `<div class="book-index">
                  <div class="book-area">
                    <a class="book-area__link" href="/books/${book.id}/notes"></a>
                    <div class="book-area__image">
                      <img height="170px" width="120px" src="${book.image}">
                    </div>
                    <div class="book-area__title">
                      ${book.title}
                    </div>
                    <div class="book-area__author">
                      ${book.author}
                    </div>
                  </div>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='error-message'>${ msg }</div>`
    $(".add-book-area").append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/books/searches',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(books) {
      search_list.empty();
      if (books.length !== 0) {
        books.forEach(function(book) {
          appendBook(book);
        });
      } 
      else {
        $(".error-message").empty();
        appendErrMsgToHTML("一致する本がありません");
      };
    })
  });

})