class GameBoard
  attr_reader :cells
  def initialize
    @cells = Array.new(9,0)
  end

  def number_of_rows
    3
  end

  def cells_x_row
    3
  end
end
