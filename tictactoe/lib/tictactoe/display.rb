module Tictactoe
  class Display
    def initialize(output, gameboard)
      @output = output
      @board = gameboard
      @instructions_board = [1,2,3,4,5,6,7,8,9]
    end

    def welcome_message
      @output.puts 'Welcome to Tic-Tac-Toe!'
    end

    def game_instructions
      @output.puts 'Every turn you play, you must choose a position number from the gameboard:'
      print_gameboard @instructions_board, 3, 3
      @output.puts 'The current state of the gameboard is:'
    end

    def print_gameboard gameboard, rows_number, cells_x_row
      board = gameboard
      board.reverse!
      (1..rows_number).each {@output.puts(board.pop(cells_x_row).reverse!.join" ")}
    end

    def gameboard
      print_gameboard @board.cells, 3, 3
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
