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

  $("#user_login").click(function(){
    var email = $("#user_email").val();
    var password = $("#user_password").val();
    if($.trim(email) == "" || $.trim(password) == ""){
      alert("email or password is null!");
      return;
    }
    $.ajax({
      type: "POST",
      url:  "/signin",
      data: {email: email,password: password},
      success: function(user){
        if(user == -1){
          alert("登录失败");
        } else{
          $("#loginDialog").modal('hide');
        }
      }
    });
  });

  $("#user_logout").click(function(){
    if(!window.confirm("确定退出")){
      return;
    }
    $.ajax({
      type: "DELETE",
      url:  "/logout",
      success: function(msg){
      }
    });
  });

  $("#login_and_pay").click(function(){
    $("#loginDialog").modal("show");
  });
  $("#login_reg").click(function(){
    $("#loginDialog").modal("hide");
    $("#regDialog").modal("show");
  });
});

