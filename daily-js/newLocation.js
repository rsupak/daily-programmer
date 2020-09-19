var myGPS = {
  options: {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  },
  success: function(pos) {
    var crd = pos.coords;
    var home = {lat: crd.latitude, lng: crd.longitude}
    console.log(home)
    console.log('Your current position is:');
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    console.log(`More or less ${crd.accuracy} meters.`);
    return home
  },
  error: function(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  },
  location: navigator.geolocation.getCurrentPosition(function(position) {
    var pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };
    return pos
  })
}
var map, marker;
var location = myGPS.location;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 0, lng: 0},
    zoom: 9
  });

  map.setCenter(pos);
  // map = new google.maps.Map(document.getElementById('map'), 
  // { center: loc,
  //   zoom: 9 });
  // var marker = new google.maps.Marker({position: loc, map: map})
}

  // AIzaSyAhWrPc09gqOZa3c7B1-ICTj7ku6Jd0zlo
// myGPS.location()
