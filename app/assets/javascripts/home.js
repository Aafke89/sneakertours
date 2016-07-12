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
}, 10000);


// move the word "locations"
$(".open-locations").on("mouseenter", function(){
  $(".item-locations").css("bottom", "-73px");
});

$(".open-locations").on("mouseleave", function(){
  $(".item-locations").css("bottom", "-82px");
});

// move the word "events"
$(".open-events").on("mouseenter", function(){
  $(".item-events").css("bottom", "-136px");
});

$(".open-events").on("mouseleave", function(){
  $(".item-events").css("bottom", "-146px");
});


});
