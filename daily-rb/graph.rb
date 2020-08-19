class Vertex
  attr_accessor :name, :degrees

  def initialize(name)
    @name = name
    @degrees = 0
  end

  def to_s
    name
  end
end

class Edge
  attr_reader :v1, :v2, :vertices

  def initialize(v1, v2)
    @v1 = v1
    @v1.degrees += 1
    @v2 = v2
    @v2.degrees += 1
    @vertices = [v1, v2]
  end

  def to_s
    v1.name + v2.name
  end
end

class EdgeSet
  attr_accessor :edges

  def initialize
    @edges = []
  end

  def add(e)
    edges << e
  end

  def count
    edges.size
  end

  def edge?(e)
    edges.include?(e)
  end
end

class Graph
  attr_accessor :vertices, :edges

  def initialize(edges)
    @edges = edges
  end
end

a = Vertex.new('A')
b = Vertex.new('B')
c = Vertex.new('C')
d = Vertex.new('D')
x = Vertex.new('X')

e = Edge.new(a, b)
f = Edge.new(a, c)
m = Edge.new(a, d)
z = Edge.new(a, x)
n = Edge.new(b, c)
o = Edge.new(b, d)
p = Edge.new(c, d)

puts d.degrees
puts a.degrees
puts e

# es = EdgeSet.new
# es.add(e)
# es.add(f)
# es.add(m)
# es.add(n)
# es.add(o)
# es.add(p)

# g = Graph.new(es)

# p g
