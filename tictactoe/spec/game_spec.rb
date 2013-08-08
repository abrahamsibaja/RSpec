system('clear')
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

    describe "#mark a positio" do
      context "when the gameboard is empty" do
        it "marks position: 1" do
          game.position_to_mark(1)
          expect(game.board.cells.join(" ")).to eq("X 0 0 0 0 0 0 0 0")
        end
        it "marks position: 2" do
          game.position_to_mark(2)
          expect(game.board.cells.join(" ")).to eq("0 X 0 0 0 0 0 0 0")
        end
      end
    end
    describe "#verify_victory" do
      context "when Player 1 wins" do
        it "sets winner: X" do
          fill_board("15293")
          game.verify_victory
          #expect(game.winner).to eq('X')
        end
      end
    end
  end
end
