module Tictactoe
  class GameBoard
    attr_reader :cells
    def initialize
      @cells = Array.new(9,0)
    end
  end

  class Game
    def initialize(output)
      @output = output
      @board = GameBoard.new
    end

    def start
      @output.puts 'Welcome to Tic-Tac-Toe!'
      @output.puts @board.cells.join(" ")
    end
  end
end
