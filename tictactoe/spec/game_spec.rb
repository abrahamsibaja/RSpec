require 'spec_helper'

module Tictactoe
  describe Game do
    let(:game) {Game.new}

    def fill_board(positions)
      positions.each do |i|
        game.gameboard.position_to_mark(i, game.player_marks[game.current_player])
        game.change_player
      end
      game.change_player
    end
    
    describe "#verify_victory" do
      context "left-right diagonal check" do
        it "verifies if someone won already" do
          fill_board([1,2,3,4,5,6,7])
          game.verify_victory
          expect(game.winner).to eq('X')
        end
      end
      context "right-left diagonal check" do
        it "verifies if someone won already" do
          fill_board([1,3,2,5,4,7])
          game.verify_victory
          expect(game.winner).to eq('Y')
        end
      end
      context "horizontal check" do
        it "verifies if someone won already" do
          fill_board([5,1,4,9,6])
          game.verify_victory
          expect(game.winner).to eq('X')
        end
      end
      context "vertical check" do
        it "verifies if someone won already" do
          fill_board([5,1,2,9,8])
          game.verify_victory
          expect(game.winner).to eq('X')
        end
      end
    end
  end
end
