class AdjacencyMatrix
  class << self
    def undirected(data)
      new(data)
    end

    def directed(data)
      new(data,true)
    end

    private :new
  end

  def initialize(data, directed=false)
    @data = data
    @directed = directed
  end
end

data = {}
undirected_matrix = AdjacencyMatrix.undirected(data)
directed_matrix   = AdjacencyMatrix.directed(data)
