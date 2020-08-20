$(function() {
  // *****GoogleBooksApiを使わないことにしたのでコメントアウト*****
  // var search_list = $("#books")
  //
  // function appendBook(image, title, author, publisher, apiId) {
  //   var html = `<div class="search-book-content">
  //                 <div class="book-image">
  //                   <img class="book-image" src="${image}">
  //                 </div>
  //                 <div class="right-content">
  //                   <div class="book-info">
  //                     <div class="book-info__title">
  //                       ${title}
  //                     </div>
  //                     <div class="book-info__author">
  //                       ${author}
  //                     </div>
  //                     <div class="book-info__publisher">
  //                       ${publisher}
  //                     </div>
  //                     <div class="book-info__apiId">
  //                       ${apiId}
  //                     </div>
  //                   </div>
  //                 </div>
  //                 <div class="add-book-link">
  //                   登録
  //                 </div>
  //               </div>`
  //   search_list.append(html);
  // }
  //
  // // ISBN検索したときのアクション
  // $("#book-search").on("click", function() {
  //   const isbn = $("#isbn-form").val();
  //   const url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn;
  //
  //   $.getJSON(url, function(data) {
  //     if(!data.totalItems) {
  //       // 該当書籍がない場合の処理を書く
  //
  //     } else {
  //       $("#BookThumbnail").html('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
  //       $(".search-book-content").remove();
  //
  //       let image = data.items[0].volumeInfo.imageLinks.smallThumbnail
  //       let title = data.items[0].volumeInfo.title
  //       let author = data.items[0].volumeInfo.authors[0]
  //       appendBook(image, title, author)
  //     }
  //
  //   });
  // });
  //
  // // キーワード検索したときのアクション
  // $("#keyword-search").on("submit", function(e) {
  //   e.preventDefault();
  //   const keyword = $("#keyword-form").val();
  //   const url = `https://www.googleapis.com/books/v1/volumes?q=${keyword}&country=JP&maxResults=20`
  //
  //   $.getJSON(url, function(data) {
  //     if(!data.totalItems) {
  //       // 該当書籍がない場合の処理を書く
  //     } else {
  //       $(".search-book-content").remove();
  //       data.items.forEach(function(book) {
  //         if (book.volumeInfo.imageLinks) {
  //           var image = book.volumeInfo.imageLinks.thumbnail
  //         } else {
  //           var image = `/assets/no_image-267acfcb976ba4942183409c682b62a768afb48c328b6ba60de7b57fd83c3b56.png`
  //         }
  //         if (book.volumeInfo.authors) {
  //           var author = `${book.volumeInfo.authors[0]}`
  //         } else {
  //           var author = `不明な作者`
  //         }
  //         if (book.volumeInfo.publisher) {
  //           var publisher = book.volumeInfo.publisher
  //         } else {
  //           var publisher = `不明な出版社`
  //         }
  //         var title = book.volumeInfo.title
  //         var apiId = book.id
  //
  //         appendBook(image, title, author, publisher, apiId)
  //       });
  //     };
  //   });
  // });
  //
  // // books#newの登録用
  // $("#books").on("click", ".add-book-link", function() {
  //   var imageUrl = $(this).prev().prev().children("img").attr("src");
  //   var title = $(this).prev().children(".book-info").children(".book-info__title").text();
  //   var author = $(this).prev().children(".book-info").children(".book-info__author").text();
  //   var publisher = $(this).prev().children(".book-info").children(".book-info__publisher").text();
  //   var apiId = $(this).prev().children(".book-info").children(".book-info__apiId").text();
  //
  //   $("#image-url-form").val($.trim(imageUrl));
  //   $("#title-form").val($.trim(title));
  //   $("#author-form").val($.trim(author));
  //   $("#publisher-form").val($.trim(publisher));
  //   $("#api-id-form").val($.trim(apiId));
  //
  //   $("#modal-book-image").children("img").attr('src', imageUrl);
  //   $("#modal-book-title").text(title);
  //   $("#modal-book-author").text(author);
  //   $("#modal-book-publisher").text(publisher);
  //
  //   $('#overlay').fadeIn();
  //   $("#modal-close-btn").on("click", function() {
  //     $('#overlay').fadeOut();
  //   })
  //   $("#delete-comformation-btn__form").on("click", function() {
  //     deleteBtn.click();
  //     $('#overlay').fadeOut();
  //   })
  // })
})