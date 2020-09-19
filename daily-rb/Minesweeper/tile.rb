class Tile
  attr_accessor :bomb, :revealed, :value
  def initialize
    @revealed = true
    @value = ' '
    @bomb = false
  end

  def bomb_setter
    @bomb = true
    @value = 'B'
  end

  def to_s
    @revealed ? @value : '*'
  end

  def inspect
    puts @revealed.inspect
    "#{@bomb.inspect}, #{@value.inspect},"
  end
end
