module Tictactoe
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

    def position_to_mark(position, mark)
      @cells[position.to_i-1] = mark
    end
    
    def gameboard_full?
      !@cells.include?(0)
    end

    def available?(position)
      @cells[position-1] == 0
    end

  end
end
