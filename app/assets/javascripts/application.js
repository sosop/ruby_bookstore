// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function(){
  $('.carousel').carousel({
    interval: 2000
  })
  $("#addToCart").click(function(){
    num = $("#num").val();
    if(!$.isNumeric(num)){
      $(".alert").fadeIn();
      $("#num").val("1");
      return;
    }
    book_id = $(this).attr("bookId");
    $.ajax({
      type: "POST",
      url:  "/cart_book/create",
      data: {book_id: book_id ,num: num},
      success: function(msg){
        $("#opt").show();
      }
    });
  });
  $(".close").click(function(){
    $(this).parent(".alert").fadeOut();
  })
  /*
  $("#clearCart").click(function(){
    if(!window.confirm("确定要清空吗？")){
      return;
    }
    id = $(this).attr("val")
    $.ajax({
      type: "DELETE",
      url:  "/carts/" + id,
      success: function(msg){
        $("#opt").hide();
      }
    });
  });*/
});

