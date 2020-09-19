# Graph class to be used with Dijkstra's to find adjacency matrix and
# take an elementary look at his shortest path problem
class Graph
  attr_accessor :adjacency_matrix, :distance, :graph
  attr_accessor :nodes, :previous, :total_nodes, :final_destinations

  def initialize(total_nodes)
    @total_nodes = total_nodes
    @graph = {}
    @nodes = []
    @final_destinations = []
    @index_in_matrix = 0
    @adjacency_matrix = Array.new(@total_nodes) { Array.new(@total_nodes) }
  end

  # adds node to the graph by taking a name parameter, checking if the new node
  # fits into the determined graph size, the node to the nodes array along with
  # an incremented index value.
  def add_node(name, end_point)
    return if @index_in_matrix >= total_nodes

    node = { name: name, index_in_matrix: @index_in_matrix, end_point: end_point }
    nodes << node
    final_destinations << node if node[:end_point] == true
    @adjacency_matrix[@index_in_matrix][@index_in_matrix] = 0
    @index_in_matrix += 1
    node
  end

  # method for determining if node already exist in the graph
  # returns true if node with name exists in the nodes array
  def node?(name)
    @nodes.each do |node|
      return true if node[:name] == name
    end
    false
  end

  # method for accessing a node in the graph by name
  # returns node if node with name exists in the nodes array
  def find_node(name)
    @nodes.each { |node| return node if node[:name] == name }
  end

  # method for creating an edges in the graph.
  # first the method determines if node names passed in currently exist in the
  # graph, if so, it creates a new edge with nodes in graph, if not, it firsts
  # adds the node to the graph, then creates the connecting edge
  def add_edge(name1, name2, weight)
    node?(name1) ? find_node(name1) : add_node(name1)
    node?(name2) ? find_node(name2) : add_node(name2)
    connect_graph(name1, name2, weight)
    connect_graph(name2, name1, weight)
    add_adjacency(name1, name2)
  end

  # creates a connection between nodes
  def connect_graph(source, target, weight)
    if !graph.key?(source)
      graph[source] = { target => weight }
    else
      graph[source][target] = weight
    end
  end

  # method builds an adjacency matrix for the graph
  # an adjacency matrix is an array of all connecting points from
  # each node in the graph.
  def add_adjacency(name1, name2)
    i = find_node(name1)[:index_in_matrix]
    j = find_node(name2)[:index_in_matrix]
    @adjacency_matrix[i][j] = @graph[name1][name2]
    @adjacency_matrix[j][i] = @graph[name2][name1]
  end

  # method returns an array of neighbors of the node passed in as a parameter with
  # the weight of each of the edge connections.
  def neighbors_with_weight(node)
    index = node[:index_in_matrix]
    neighbors = []
    @adjacency_matrix[index].each.with_index do |neighbor, i|
      unless neighbor.nil? || neighbor.zero?
        neighbors << { index_in_matrix: i, weight: neighbor }
      end
    end
    neighbors
  end

  # Dijkstra's algorithm based off of wikipedia pseudocode
  # https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
  def dijkstra(source)
    @distance = {}
    @previous = {}
    @graph.keys.each do |node|
      @distance[node] = Float::INFINITY
      @previous[node] = -1
    end
    @distance[source] = 0
    unvisited = @graph.keys.compact

    until unvisited.empty?
      u = nil?
      unvisited.each do |min|
        u = min if !u || (@distance[min] && @distance[min] < distance[u])
      end
      break if @distance[u] == Float::INFINITY

      unvisited -= [u]
      @graph[u].keys.each do |v|
        temp = @distance[u] + @graph[u][v]

        if temp < @distance[v]
          @distance[v] = temp
          @previous[v] = u
        end
      end
    end
  end

  # method returns total weight of shortest path between nodes
  # if the nodes are not connected, Float::INFINITY is returned
  def find_shortest_path(name1, name2)
    dijkstra(name1)
    @distance[name2].nil? ? Float::INFINITY : @distance[name2]
  end

  def get_cheapest_cost(name1)
    total_costs = []
    @final_destinations.each do |node|
      name2 = node[:name]
      total_costs << find_shortest_path(name1, name2)
    end
    total_costs.min
  end
end

# test code
graph = Graph.new(26)
graph.add_node("A", false)
graph.add_node("B", false)
graph.add_node("C", false)
graph.add_node("D", false)
graph.add_node("E", true)
graph.add_node("F", false)
graph.add_node("G", false)
graph.add_node("H", true)
graph.add_node("I", true)
graph.add_node("J", false)
graph.add_node("K", true)
graph.add_node("L", true)

graph.add_edge("A", "B", 5)
graph.add_edge("A", "C", 3)
graph.add_edge("A", "D", 6)
graph.add_edge("B", "E", 4)
graph.add_edge("C", "F", 2)
graph.add_edge("C", "G", 0)
graph.add_edge("D", "H", 1)
graph.add_edge("D", "I", 11)
graph.add_edge("F", "J", 1)
graph.add_edge("G", "K", 10)
graph.add_edge("J", "L", 1)
graph.dijkstra('A')
p graph.distance

p graph.get_cheapest_cost("A")
