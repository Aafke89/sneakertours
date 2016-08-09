$(document).ready(function(){
// Open list with locations on click
$(".btn-loc-list-show").on("click", function(){
  $(".locations-list").css("display", "block");
  $(".btn-loc-list-show").css("display", "none");
  $(".btn-loc-list-hide").css("display", "block")
});

$(".btn-loc-list-hide").on("click", function(){
  $(".locations-list").css("display", "none");
  $(".btn-loc-list-show").css("display", "block");
  $(".btn-loc-list-hide").css("display", "none")
});

// Reset on screenwidth
$(window).resize(function() {
  if ($(this).width() < 510) {
    $('.locations-list').hide();
    $(".btn-loc-list-show").show();
    $(".btn-loc-list-hide").hide();
  } else {
    $('.locations-list').show();
    $(".btn-loc-list-show").hide();
    $(".btn-loc-list-hide").show();
    }
});

});
