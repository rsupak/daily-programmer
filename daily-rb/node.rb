class Node
  attr_accessor :title, :rating, :left, :right, :parent

  def initialize(title, rating)
    @title = title
    @rating = rating
  end

  def to_s
    "#{title}: #{rating} | P #{parent} | L #{left} | R #{right}"
  end
end
