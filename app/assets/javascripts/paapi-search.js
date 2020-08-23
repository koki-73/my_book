$(function() {
  // APIで取得したデータを表示する関数
  let search_list = $("#books")
  function appendBook(image_url, title, author, publisher, apiId, url) {
    const html = `<div class="search-book-content">
                  <div class="book-image">
                    <img class="book-image" src="${image_url}">
                  </div>
                  <div class="right-content">
                    <div class="book-info">
                      <div class="book-info__title">
                        ${title}
                      </div>
                      <div class="book-info__author">
                        ${author}
                      </div>
                      <div class="book-info__publisher">
                        ${publisher}
                      </div>
                      <div class="book-info__apiId">
                        ${apiId}
                      </div>
                      <div class="book-info__url">
                        ${url}
                      </div>
                    </div>
                  </div>
                  <div class="add-book-link">
                    登録
                  </div>
                </div>`
    search_list.append(html);
  }

  // 通信中の表示関数
  function dispLoading(msg){
    let dispMsg = "<div class='loadingMsg'>" + msg + "</div>";
    $("body").append("<div id='loading'>" + dispMsg + "</div>");
  }

  // 通信中の表示を消す関数
  function removeLoading(){
    $("#loading").remove();
  }

  // 検索フォームの処理
  $("#keyword-search").on("submit", function(e) {
    const keyword = $("#keyword-form").val();
    if (keyword == '') {
      alert("キーワードを入力してください");
    } else {
      e.preventDefault();
      dispLoading("検索中...");
      $.ajax({
        url: '/books/paapi_searches',
        type: 'GET',
        data: {'keywords': keyword},
        dataType: 'json',
        timeout: 10000
      })
      .done(function(items){
        $(".search-book-content").remove();
        items.forEach(function(item){
          let image_url;
          let author;
          let publisher;
          if (item.image_url == null) {
            image_url = `/assets/no_image-267acfcb976ba4942183409c682b62a768afb48c328b6ba60de7b57fd83c3b56.png`
          } else {
            image_url = item.image_url
          }
          if (item.authors == null || item.authors.length == 0) {
            author = '不明な作者'
          } else {
            author = `${item.authors[0]}`
          }
          if (item.publisher == null) {
            publisher = '不明な出版社'
          } else {
            publisher = item.publisher
          }
          let title = item.title
          let apiId = item.apiId
          let url = item.url
          appendBook(image_url, title, author, publisher, apiId, url);
        })
      })
      .fail(function(){
        alert("検索に失敗しました");
      })
      .always( function(data) {
        // Lading 画像を消す
        removeLoading();
      });
    }
  });

  $("#books").on("click", ".add-book-link", function() {
    // 本の各データを取得
    let imageUrl = $(this).prev().prev().children("img").attr("src");
    let title = $(this).prev().children(".book-info").children(".book-info__title").text();
    let author = $(this).prev().children(".book-info").children(".book-info__author").text();
    let publisher = $(this).prev().children(".book-info").children(".book-info__publisher").text();
    let apiId = $(this).prev().children(".book-info").children(".book-info__apiId").text();
    let url = $(this).prev().children(".book-info").children(".book-info__url").text();

    // 本登録用のフォームに自動入力
    $("#image-url-form").val($.trim(imageUrl));
    $("#title-form").val($.trim(title));
    $("#author-form").val($.trim(author));
    $("#publisher-form").val($.trim(publisher));
    $("#api-id-form").val($.trim(apiId));
    $("#url-form").val($.trim(url));

    // モーダルに選択した本の情報を表示
    $("#modal-book-image").children("img").attr('src', imageUrl);
    $("#modal-book-title").text(title);
    $("#modal-book-author").text(author);
    $("#modal-book-publisher").text(publisher);

    // モーダルの表示
    $('#overlay').fadeIn();
    $("#modal-close-btn").on("click", function() {
      $('#overlay').fadeOut();
    })
    $("#delete-comformation-btn__form").on("click", function() {
      deleteBtn.click();
      $('#overlay').fadeOut();
    })
  })
})
