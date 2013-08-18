require 'spec_helper'

module Tictactoe
  describe Game do
    let(:game) {Game.new}

    def fill_board(positions)
      (1..positions.length).each do |i|
        game.position_to_mark(positions[i-1].to_i)
        game.change_player
      end
    end

  end
end
