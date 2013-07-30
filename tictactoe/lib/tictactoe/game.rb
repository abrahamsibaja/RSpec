module Tictactoe

  class Game
    attr_reader :board
    def initialize(output)
      @player_1 = Player.new('X')
      @player_2 = Player.new('Y')
      @current_player = @player_1
      @output = output
      @board = GameBoard.new
      @win_posibilities = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    end

    def start
      welcome_message
      game_cicle
    end

    def welcome_message
      @output.puts 'Welcome to Tic-Tac-Toe!'
      @output.puts @board.cells.join(" ")
    end

    def game_cicle
      (1..9).each do
        game_intro
        position = gets
        position(position)
        verify_victory
        break unless @winner.nil?
        change_player
      end
      @output.puts "Tied Game !!" if @winner.nil?
    end

    def game_intro
      @output.puts 'Choose a position: '
    end

    def verify_victory 
      @win_posibilities.each do |posibility| 
        if @board.cells.values_at(*posibility).all? {|cell| cell == @current_player.symbol_mark} 
          @winner = @current_player.symbol_mark
          @output.puts "Congratulations Player #{@winner} you are the winner!!"
        end
      end
    end

    def position position
      @board.cells[position.to_i-1] = @current_player.symbol_mark
      @output.puts @board.cells.join(" ")
    end

    def change_player
      @current_player = @current_player==@player_2 ? (@player_1):(@player_2)
    end
  end
end
