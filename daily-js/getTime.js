// //This CODE is NOT working//
// var movie1 = {
//     title: "Tinker Tailor Soldier Spy",
//     genre: "Drama Mystery Spy Thriller",
//     rating: 4.5,
//     showtimes: ["10.00am", "1.00pm", " 4.00pm", "7.00pm", "10.00pm"]
// }
// var movie2 = {
//     title: "Sherlock Holmes",
//     genre: "Drama Mystery Spy Thriller",
//     rating: 4.5,
//     showtimes: ["10:00am", "1:00pm", " 4:00pm", "7:00pm", "10:00pm"]
// }
// function getNextShowing(movie) {
//     var now = new Date().getTime();
//     for (var i = 0; i < movie.showtimes.length; i++) {
//         var showtime = getTimeFromString(movie.showtimes[i]);
//         if ((showtime - now) > 0) {
//             return "Next showing of " + movie.title + "is" + movie.showtimes[i];
//         }
//     }
//     return null;
// }
// function getTimeFromString(timeString) {
//     var theTime = new Date();
//     var time = timeString.match(/(\d+)(?::(\d\d))?\s*(p?)/);
//     theTime.setHours(parseInt(time[1]) + (time[3] ? 12 : 0));
//     theTime.setMinutes(parseInt(time[2]) || 0);
//     return theTime.getTime();
// }
// var nextShowing = getNextShowing(movie1);
// console.log(nextShowing);
// nextShowing = getNextShowing(movie2);
// console.log(nextShowing);
// document.write(getNextShowing(movie2))
function getTimeFromString(timeString) {
    var theTime = new Date();
    var time = timeString.match(/(\d+)(?:\.(\d+))?\s*(p?)/);
    theTime.setHours(parseInt(time[1]) + (time[3] && time[1] != 12 ? 12 : 0));
    console.log(time[1])
    theTime.setMinutes(parseInt(time[2]) || 0);
    return theTime.getTime();
}

function Movie(title, genre, rating, showtimes) {
    this.title = title;
    this.genre = genre;
    this.rating = rating;
    this.showtimes = showtimes;
    this.getNextShowing = function() {
        var now = new Date().getTime();
        console.log("now: " + now)
        var nextShowtimes = []
        for (var i = 0; i < this.showtimes.length; i++) {
            var showtime = getTimeFromString(this.showtimes[i]);
            console.log(showtime - now)
            if ((showtime - now) > 0) {
                // return " Next showing of " + this.title + "is" + this.showtimes[i];
                nextShowtimes.push(this.showtimes[i])
            }
        }
        console.log(nextShowtimes)
    };
}

var sherlockHolmes = new Movie("SH", "Spy-thriller", 4.1, ["10.00am", "12.30pm", "3.30pm", "5.30pm", "8.00pm", "10.00pm"]);

// console.log(sherlockHolmes.showtimes)
console.log(sherlockHolmes.getNextShowing());
