module Tictactoe
  class Display
    attr_reader :board
    def initialize(output, gameboard)
      @output = output
      @board = gameboard
      @instructions_board = GameBoard.new
      fill_instructions_board
    end
    
    def fill_instructions_board
      (1..9).each {|i| @instructions_board.cells[i-1] = i}
    end

    def welcome_message
      @output.puts 'Welcome to Tic-Tac-Toe!'
    end

    def game_instructions
      @output.puts 'Every turn you play, you must choose a position number from the gameboard:'
      print_gameboard @instructions_board
      @output.puts 'The current state of the gameboard is:'
    end

    def print_gameboard gameboard
      board = gameboard.cells.dup
      (1..gameboard.number_of_rows).each {@output.puts(board.shift(gameboard.cells_x_row).join" ")}
    end

    def tied_game_message
      @output.puts "Tied Game !!" if @winner.nil?
    end

    def position_message
      @output.puts 'Choose a position: '
    end

    def winner_message(winner)
      @output.puts "Congratulations Player #{winner} you are the winner!!"
    end
  end
end
