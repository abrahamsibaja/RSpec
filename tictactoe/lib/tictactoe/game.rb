module Tictactoe
  class Game
    def initialize(output)
      @output = output
      @board = GameBoard.new
    end

    def start
      @output.puts 'Welcome to Tic-Tac-Toe!'
      @output.puts @board.cells.join(" ")
      @output.puts 'Choose a position: '
    end

    def position position

    end
  end
end
