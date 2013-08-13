require 'spec_helper'

module Tictactoe
    describe GameBoard do
    let(:gameboard) {GameBoard.new}

    describe "#mark a position" do
      context "when the gameboard is empty" do
        it "marks position: 1" do
          position_to_mark(1)
          expect(cells.join(" ")).to eq("X 0 0 0 0 0 0 0 0")
        end
        it "marks position: 2" do
          position_to_mark(2)
          expect(cells.join(" ")).to eq("0 X 0 0 0 0 0 0 0")
        end
      end
    end

  end
end
