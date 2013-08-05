module Tictactoe
  class Game
    attr_reader :board
    attr_reader :display
    def initialize(output)
      @player_1 = Player.new('X')
      @player_2 = Player.new('Y')
      @current_player = @player_1
      @board = GameBoard.new
      @display = Display.new(output, @board)
      @win_posibilities = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    end

    def start
      welcome_message
      game_cicle
    end

    def welcome_message
      @display.welcome_message
      @display.game_instructions
      @display.gameboard
    end

    def game_cicle
      (1..9).each do
        make_movement
        verify_victory
        break unless @winner.nil?
        change_player
      end
      @display.tied_game_message
    end

    def make_movement
      @display.position_message
      position = gets
      position(position)
      @display.gameboard
    end

    def position position
      @board.cells[position.to_i-1] = @current_player.symbol_mark
    end

    def verify_victory 
      @win_posibilities.each do |posibility| 
        if @board.cells.values_at(*posibility).all? {|cell| cell == @current_player.symbol_mark} 
          @winner = @current_player.symbol_mark
          @display.winner_message(@winner)
        end
      end
    end

    def change_player
      @current_player = @current_player==@player_2 ? (@player_1):(@player_2)
    end
  end
end
