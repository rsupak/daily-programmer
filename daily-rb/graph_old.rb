class Vertex
  attr_accessor :name, :neighbors, :weights

  def initialize(name)
    @name = name
    @neighbors = []
    @weights = []
  end
end

class Graph
  attr_accessor :vertices

  def initialize
    @vertices = []
  end

  def add_vertex(name)
    @vertices << Vertex.new(name)
  end

  def find_vertex_by_name(name)
    vertices.each do |v|
      return v if v.name == name
    end
    nil
  end

  def count
    vertices.length
  end

  def add_edge(start_name, end_name, weight = nil, undirected = true)
    from = vertices.index { |v| v.name == start_name }
    to   = vertices.index { |v| v.name == end_name }
    vertices[from].neighbors[to] = true
    vertices[from].weights[to] = weight if weight
    if undirected
      vertices[to].neighbors[from] = true
      vertices[to].weights[from] = weight if weight
    end
  end
end
g = Graph.new
p g
