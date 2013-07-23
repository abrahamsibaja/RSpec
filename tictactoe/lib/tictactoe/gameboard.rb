class GameBoard
  attr_reader :cells
  def initialize
    @cells = Array.new(9,0)
  end
end
