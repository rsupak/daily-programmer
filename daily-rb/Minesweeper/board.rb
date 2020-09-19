require_relative 'tile'

class Board
  attr_reader :grid

  def fill_board
    Array.new(9) { Array.new(9) { Tile.new } }
  end

  def initialize(grid = fill_board)
    @grid = grid
  end

  def place_bombs
    bombs = 0
    until bombs == 10
      selection = ['B', ' '].sample
      row, col = rand(0..8), rand(0..8)
      next if @grid[row][col].value == 'B'

      if selection == 'B'
        @grid[row][col].bomb_setter
        bombs += 1
      end
    end
  end

  def render
    puts "  #{(0..8).to_a.join(' ')}"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
  end

  def get_tile_value(row, col)
    p @grid[row][col].value
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  board.place_bombs
  board.get_tile_value(2, 3)
  board.render
end
