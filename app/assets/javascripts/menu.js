$(document).ready(function(){
// move the word "locations"
$(".menu-1").on("mouseenter", function(){
  $(".menu-1-text").removeClass("hidden");
  $(".menu-cross-1").css("color", "yellow");
});

$(".menu-1").on("mouseleave", function(){
  $(".menu-1-text").addClass("hidden");
  $(".menu-cross-1").css("color", "black");
});

$(".menu-2").on("mouseenter", function(){
  $(".menu-2-text").removeClass("hidden");
  $(".menu-cross-2").css("color", "yellow");
});

$(".menu-2").on("mouseleave", function(){
  $(".menu-2-text").addClass("hidden");
  $(".menu-cross-2").css("color", "black");
});

$(".menu-3").on("mouseenter", function(){
  $(".menu-3-text").removeClass("hidden");
  $(".menu-cross-3").css("color", "yellow");
});

$(".menu-3").on("mouseleave", function(){
  $(".menu-3-text").addClass("hidden");
  $(".menu-cross-3").css("color", "black");
});

});
