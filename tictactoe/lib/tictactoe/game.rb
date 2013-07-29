module Tictactoe

  class Game
    def initialize(output)
      @player_1 = Player.new
      @player_1.set_symbol_mark('X')
      @player_2 = Player.new
      @player_2.set_symbol_mark('Y')
      @current_player = @player_1
      @output = output
      @board = GameBoard.new
    end

    def start
      game_intro
      game_cicle
    end

    def game_intro
      @output.puts 'Welcome to Tic-Tac-Toe!'
      @output.puts @board.cells.join(" ")
    end

    def game_cicle
      (1..9).each do
        play
        change_player
      end
    end

    def play
      @output.puts 'Choose a position: '
    end

    def change_player
      @current_player = @current_player==@player_2 ? (@player_1):(@player_2)
    end

    def position position
      @board.cells[position.to_i-1] = @current_player.symbol_mark
      @output.puts @board.cells.join(" ")
    end
  end
end
