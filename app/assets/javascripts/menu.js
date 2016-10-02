$(document).ready(function(){
// move the word "locations"
$(".menu-1").on("mouseenter", function(){
  $(".menu-1-text").removeClass("hidden");
  $(".menu-cross-1").css("color", "rgb(248, 48, 114)");
});

$(".menu-1").on("mouseleave", function(){
  $(".menu-1-text").addClass("hidden");
  $(".menu-cross-1").css("color", "black");
});

$(".menu-2").on("mouseenter", function(){
  $(".menu-2-text").removeClass("hidden");
  $(".menu-cross-2").css("color", "rgb(248, 48, 114)");
});

$(".menu-2").on("mouseleave", function(){
  $(".menu-2-text").addClass("hidden");
  $(".menu-cross-2").css("color", "black");
});

$(".menu-3").on("mouseenter", function(){
  $(".menu-3-text").removeClass("hidden");
  $(".menu-cross-3").css("color", "rgb(248, 48, 114)");
});

$(".menu-3").on("mouseleave", function(){
  $(".menu-3-text").addClass("hidden");
  $(".menu-cross-3").css("color", "black");
});

$(".menu-mobile-cross").on("mouseenter", function(){
  $(".menu-mobile-links").removeClass("hidden");
  $(".menu-mobile-cross").addClass("hidden");
  // $(".menu-mobile-cross").css("color", "rgb(248, 48, 114)");
});

$(".menu-mobile-links").on("mouseleave", function(){
  $(".menu-mobile-links").addClass("hidden");
  $(".menu-mobile-cross").removeClass("hidden");
  // $(".menu-cross-1").css("color", "black");
});

});
