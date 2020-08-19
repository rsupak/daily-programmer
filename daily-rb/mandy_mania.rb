def build_board
  board = {
    0 => [],
    1 => [1, 1, 1],
    2 => [1, 1, 1],
    3 => [1, 1, 1],
    4 => [1, 1, 1],
    5 => [1, 1, 1],
    6 => [1, 1, 1],
    7 => [1, 1, 1],
    8 => [1, 1, 1],
    9 => []
  }
  p board
end

def move_pieces(user, board, location)
  direction = user == 1 ? left : right

  board
end

def move_left(board, location)
  count = board[location]
  
  board
end

def move_right(board, location)
  board
end

board = build_board
board[0] << board[1].pop
p board
