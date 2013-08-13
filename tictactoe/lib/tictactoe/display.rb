module Tictactoe
  class Display
    attr_reader :game
    def initialize(output)
      @output = output
      @game = Game.new
      @instructions_board = GameBoard.new
      fill_instructions_board
    end

    def fill_instructions_board
        (1..9).each {|i| @instructions_board.cells[i-1] = i}
    end

    def game_cicle
      game_intro
      until @game.game_over? do
        make_movement
        @game.verify_victory
        @game.change_player
      end
      match_results
    end

    def game_intro
      welcome_message
      game_instructions
      print_gameboard(@game.board)
    end

    def welcome_message
      @output.puts 'Welcome to Tic-Tac-Toe!'
    end

    def game_instructions
      @output.puts 'Every turn you play, you must choose a position number from the gameboard:'
      print_gameboard @instructions_board
      @output.puts 'The current state of the gameboard is:'
    end

    def print_gameboard(gameboard)
      board = gameboard.cells.dup
      (1..gameboard.number_of_rows).each {@output.puts(board.shift(gameboard.cells_x_row).join" ")}
    end

    def make_movement
      position_message
      position = gets.to_i
      valid_position?(position)
      print_gameboard(@game.board)
    end

    def valid_position?(position)
      until @game.valid?(position) do
        puts "Choose a valid position (1 - 9):"
        position = gets.to_i
      end
      playerMark = @game.player_marks[@game.current_player]
      @game.position_to_mark(position, playerMark)
    end

    def position_message
      @output.puts 'Choose a position: '
    end

    def winner_message(winner)
      @output.puts "Congratulations Player #{winner} you are the winner!!"
    end

    def tied_game_message
      @output.puts "Tied Game !!" if @winner.nil?
    end

    def match_results
      result = tied_game_message if @game.gameboard_full?
      result = winner_message(@game.winner) if @game.player_wins?
      return result
    end
  end
end
