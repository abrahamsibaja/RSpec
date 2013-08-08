module Tictactoe
  class Game
    attr_reader :board
    attr_reader :display
    def initialize(output)
      @player_marks = {"player_1" => 'X', "player_2" => 'Y'}
      @current_player = "player_1"
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
      @display.print_gameboard @board
    end

    def game_cicle
      (1..9).each do
        make_movement
        verify_victory
        break if player_wins?
        change_player
      end
      @display.tied_game_message
    end

    def make_movement
      @display.position_message
      position = gets
      position_to_mark(position)
      @display.print_gameboard @board
    end

    def position_to_mark position
      @board.cells[position.to_i-1] = @player_marks[@current_player]
    end

    def verify_victory 
      @win_posibilities.each do |posibility| 
        if @board.cells.values_at(*posibility).all? {|cell| cell == @player_marks[@current_player]} 
          @winner = @player_marks[@current_player]
          @display.winner_message(@winner)
        end
      end
    end

    def player_wins?
      !@winner.nil?
    end

    def change_player
      @current_player = @current_player== "player_2" ? "player_1":"player_2"
    end
  end
end
