const myObj = {
  name: 'Skip',
  age: 2,
  favoriteFood: "steak",
  myArray: ["food", 5, [1,2,3,4], {address: "1234 Test St.", married: false}]
};

var myObjJson = JSON.stringify(myObj);
// console.log(myObjJson);
var data = JSON.parse(myObjJson);
// console.log(data); 
// console.log(data.name)
console.log(data.myArray[3].married)















// console.log(myObj)
// console.log()
// let json = JSON.stringify(myObj)
// console.log(json);
// console.log()
// console.log(JSON.parse(json))


















// let weather = {
//   "data": [{
//     "rh": 75,
//     "pod": "d",
//     "lon": -82.45843,
//     "pres": 1019.3,
//     "timezone": "America\/New_York",
//     "ob_time": "2019-11-13 21:47",
//     "country_code": "US",
//     "clouds": 100,
//     "ts": 1573681620,
//     "solar_rad": 16,
//     "state_code": "FL",
//     "city_name": "Tampa",
//     "wind_spd": 14,
//     "last_ob_time": "2019-11-13T21:47:00",
//     "wind_cdir_full": "east-northeast",
//     "wind_cdir": "ENE",
//     "slp": 1019.8,
//     "vis": 3.1,
//     "h_angle": 60,
//     "sunset": "22:38",
//     "dni": 381.61,
//     "dewpt": 57.8,
//     "snow": 0,
//     "uv": 0.921342,
//     "precip": 0,
//     "wind_dir": 75,
//     "sunrise": "11:50",
//     "ghi": 79.76,
//     "dhi": 43.27,
//     "aqi": 37,
//     "lat": 27.94752,
//     "weather": {
//       "icon": "c02d",
//       "code": "802",
//       "description": "Scattered clouds"
//     },
//     "datetime": "2019-11-13:21",
//     "temp": 66,
//     "station": "D3253",
//     "elev_angle": 6.89,
//     "app_temp": 65.7
//   }],
//   "count": 1
// }

// let weather_json = JSON.stringify(weather)
// console.log(weather_json)
// console.log()
// console.log(weather)
// console.log(`Location: ${weather.data[0].city_name}, ${weather.data[0].state_code}
// Temperature: ${weather.data[0].temp}°F`);

// console.log("Location: " + weather.data[0].city_name + ", " + weather.data[0].state_code + "\nTemperature: " + weather.data[0].temp + "\xB0F");







// const myObjStr = JSON.stringify(myObj);

// console.log(myObjStr);
// // "{"name":"Skip","age":2,"favoriteFood":"Steak"}"

// console.log(JSON.parse(myObjStr));
// // Object {name:"Skip",age:2,favoriteFood:"Steak"}
