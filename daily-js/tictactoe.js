

console.log('   |   |');
console.log('   |   |');
console.log('-----------')
console.log('   |   |');
console.log('   |   |');
console.log('-----------')
console.log('   |   |');
console.log('   |   |');

// function draw_board(board) {
//   console.log('   |   |');
//   console.log(' ' + board[7] + ' | ' + board[8] + ' | ' + board[9]);
//   console.log('   |   |');
//   console.log(' ' + board[7] + ' | ' + board[8] + ' | ' + board[9]);
//   console.log('   |   |');
//   console.log(' ' + board[7] + ' | ' + board[8] + ' | ' + board[9]);
//   console.log('   |   |');
// }

function player_letters() {
  letter = ""
  while (!letter === "X" or !letter === "O") {
    console.log("Do you want to be X or O?:")
    letter = prompt().toUpperCase();
    console.log("Player 1 chose: " + letter);

    if (letter === "X") {
      return ["X", "O"];
    } else {
      return ["O", "X"];
    }
  }
}

function first_player() {
  if (Math.random(0, 1) === 0) {
    return "Player_two";
  } else {
    return "Player_one";
  }
}

function player_turn() {
  for (let i = 0; i < 9; i++) {
    if (turn_num % 2 !== 0) {
      return true;
    } else {
      return false;
    }
  }
}

function choose_move(board) {
  let move = ' ';
  while (move)
}
