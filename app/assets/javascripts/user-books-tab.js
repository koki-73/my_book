$(function() {
  let tabs = $(".books-menu-tab");
  $(".books-menu-tab").on("click", function() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".user-books-area").removeClass("show").eq(index).addClass("show");
  })
})