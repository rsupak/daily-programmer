`use strict`;
function rot13(str) { // LBH QVQ VG!
  var numArr = [];
  var currentPosition;
  var shiftPosition;
  for (var i = 0; i < str.length; i++) {
    currentPosition = str.charCodeAt(i);
    shiftPosition = str.charCodeAt(i) + 13;
    if (shiftPosition > 90) {
      numArr.push(String.fromCharCode(currentPosition - 13));
    } else if (shiftPosition <= 90 && shiftPosition > 77) {
      numArr.push(String.fromCharCode(shiftPosition));
    } else {
      numArr.push(String.fromCharCode(currentPosition));
    }
  }
  var newStr = numArr.join('');
  return newStr;
}


// Change the inputs below to test
console.log(rot13("SERR PBQR PNZC"));
console.log(rot13("SERR CVMMN!"));
console.log(rot13("SERR YBIR?"));
console.log(rot13("GUR DHVPX OEBJA QBT WHZCRQ BIRE GUR YNML SBK."));
