// function tringTring() {
//   var animationbike1 = $(".home-bike-2").removeClass("hidden");
//   var animationbike2 = setTimeout(function() {$(".home-bike-2").addClass("hidden");}, 200 )
//   var animationbike3 = setTimeout(function() {$(".home-bike-2").removeClass("hidden");}, 400 )
//   var animationbike4 = setTimeout(function() {$(".home-bike-2").addClass("hidden");}, 600 )
//   animationbike1
//    animationbike2
//     animationbike3
//      animationbike4
// }

// function moveBike(){
//   $("#home-locations-image").animate("margin-left", "300px")
// }


function partyParty() {
  // Shows the textballoon with party now and then
  var animationparty1 = $(".couch-party").removeClass("hidden");
  var animationparty2 = setTimeout(function() {$(".couch-party").addClass("hidden");}, 300 )
  var animationparty3 = setTimeout(function() {$(".couch-party").removeClass("hidden");}, 400 )
  var animationparty4 = setTimeout(function() {$(".couch-party").addClass("hidden");}, 1200 )
  animationparty1
   animationparty2
    animationparty3
     animationparty4
}



$(document).ready(function(){

// Change word in tagline on homepage
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
  // $("#home-locations-image").show("slide", {direction: "left"}, "slow");
  // setInterval(tringTring, 6000);
});

$(".open-locations").on("mouseleave", function(){
  $(".item-locations").css("bottom", "-82px");
  // $("#home-locations-image").hide("slide", {direction: "left"}, 2000);
});

// move the word "events"
$(".open-events").on("mouseenter", function(){
  $(".item-events").css("bottom", "-136px");
  $(".home-couch").effect("bounce", "slow");
  setInterval(partyParty, 8000);
});

$(".open-events").on("mouseleave", function(){
  $(".item-events").css("bottom", "-146px");
});


});
