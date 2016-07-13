function swapImages() {
  var animationbike1 = $(".home-bike-2").removeClass("hidden");
  var animationbike2 = setTimeout(function() {$(".home-bike-2").addClass("hidden");}, 200 )
  var animationbike3 = setTimeout(function() {$(".home-bike-2").removeClass("hidden");}, 400 )
  var animationbike4 = setTimeout(function() {$(".home-bike-2").addClass("hidden");}, 600 )
  animationbike1
   animationbike2
    animationbike3
     animationbike4
}


$(document).ready(function(){

// Change word
var words = [
"BEER",
"PARTY",
"ART",
"ALTERNATIVE",
"CHEAP"
];

setInterval(function(){
  i = Math.floor((Math.random() * 5) + 1);
  $(".home-change-word").fadeOut(function(){
    $(this).html(words[i]).fadeIn();
  });
}, 6000);


// move the word "locations"
$(".open-locations").on("mouseenter", function(){
  $(".item-locations").css("bottom", "-73px");
  $("#home-locations-image").show("slide", {direction: "left"}, 2000);
  setInterval(swapImages, 6000);
});

$(".open-locations").on("mouseleave", function(){
  $(".item-locations").css("bottom", "-82px");
  // $("#home-locations-image").hide("slide", {direction: "left"}, 2000);
});

// move the word "events"
$(".open-events").on("mouseenter", function(){
  $(".item-events").css("bottom", "-136px");
  $(".home-couch").effect("bounce", "slow");
});

$(".open-events").on("mouseleave", function(){
  $(".item-events").css("bottom", "-146px");
});


});
