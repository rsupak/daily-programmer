// var myGPS = {
//   location: function () {
//       navigator.geolocation.getCurrentPosition(this.getPosition);
//   },
//   getPosition: function (pos) {
//     var lat = pos.coords.latitude;
//     var long = pos.coords.longitude;
//     // document.write("Latitude : " + lat + "<br/> Longitude : " + long)
//     // console.log("Lat: " + lat + "\nLong: " + long)
//     return [lat, long]
//   }
// }
// // var loc = myGPS.location();
// // document.write(loc)
// // alert(myGPS.location())

// function initMap() {
//   var options = {
//       //zoom: 9,
//       center: {
//           myGPS,
//       }
//   };
//   var map = new google.maps.Map(document.getElementById('map'), 
//   { center: {lat : myGPS.location()[0], long: myGPS.location()[1] },
//     zoom: 9 });
// }
// initMap()
// AIzaSyAhWrPc09gqOZa3c7B1-ICTj7ku6Jd0zlo

var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function success(pos) {
  var crd = pos.coords;

  console.log('Your current position is:');
  console.log(`Latitude : ${crd.latitude}`);
  console.log(`Longitude: ${crd.longitude}`);
  console.log(`More or less ${crd.accuracy} meters.`);
  return [crd.latitude, crd.longitude]
}

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
}

navigator.geolocation.getCurrentPosition(success, error, options);
