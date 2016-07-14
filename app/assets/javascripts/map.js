var mapStyle =[
  {
    "stylers": [
      { "saturation": -100 },
      { "lightness": 20 }
    ]
  }
]

var imageBounds = {
      north: 52.402162,
      south: 52.346415,
      east: 4.978654,
      west: 4.853680
    };

var strictBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(52.346415, 4.853680),
        new google.maps.LatLng(52.402162, 4.978654)
    );
