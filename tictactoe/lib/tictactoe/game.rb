module Tictactoe
  class Game
    def initialize(output)
      @output = output
    end

    def start
      @output.puts 'Welcome to Tic-Tac-Toe!'
    end
  end
end
