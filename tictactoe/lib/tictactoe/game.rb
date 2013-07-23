module Tictactoe
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
