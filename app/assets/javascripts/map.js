var mapStyle =[
  {
    "stylers": [
      { "saturation": -100 },
      { "lightness": 100 }
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

 // var eventsObject = {
 //        dragend: function(map) {
 //          lockBounds(map)
 //          console.log(map)
 //        },
 //        zoom_changed: function(map) {
 //          lockBounds(map)
 //        }
 //    }


    function lockBounds(map)
{

            var currentBounds = map.getBounds(),
                current_ne_lng = currentBounds.getNorthEast().lng(),
                current_ne_lat = currentBounds.getNorthEast().lat(),
                current_sw_lng = currentBounds.getSouthWest().lng(),
                current_sw_lat = currentBounds.getSouthWest().lat();

            strict_ne_lng = strictBounds.getNorthEast().lng(),
                strict_ne_lat = strictBounds.getNorthEast().lat(),
                strict_sw_lng = strictBounds.getSouthWest().lng(),
                strict_sw_lat = strictBounds.getSouthWest().lat();

            var currentCenter = map.getCenter();
            center_lng = currentCenter.lng(),
                center_lat = currentCenter.lat();

            if (current_ne_lng > strict_ne_lng) center_lng = 4.915720;
            if (current_ne_lat > strict_ne_lat) center_lat = 52.374288;
            if (current_sw_lng < strict_sw_lng) center_lng = 4.915720;
            if (current_sw_lat < strict_sw_lat) center_lat = 52.374288;

            map.setCenter(new google.maps.LatLng(center_lat, center_lng));
}
