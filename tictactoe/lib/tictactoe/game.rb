module Tictactoe
  class Game
      attr_reader :board, :winner, :player_marks, :current_player
    def initialize
      @player_marks = {"player_1" => 'X', "player_2" => 'Y'}
      @current_player = "player_1"
      @board = GameBoard.new
      @win_posibilities = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    end

    def verify_victory 
      @win_posibilities.each do |posibility| 
        if @board.cells.values_at(*posibility).all? {|cell| cell == @player_marks[@current_player]} 
          @winner = @player_marks[@current_player]
        end
      end
    end

    def player_wins?
      !@winner.nil?
    end

    def change_player
      @current_player = @current_player== "player_2" ? "player_1":"player_2"
    end

    def game_over?
      gameboard_full? || player_wins?
    end

    def gameboard_full?
      !@board.cells.include?(0)
    end

    def valid? position
      in_range?(position) && available?(position)
    end

    def in_range?(position)
      position > 0 && position < 10
    end

    def available?(position)
      @board.cells[position-1] == 0
    end
  end
end
