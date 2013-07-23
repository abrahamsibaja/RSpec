require 'spec_helper'

module Tictactoe
  describe Game do
    let(:output) {double('output').as_null_object}
    let(:game) {Game.new(output)}

    def puts? message
        output.should_receive(:puts).with(message)
    end

    describe "#start" do
      it "sends a welcome message" do
        puts? 'Welcome to Tic-Tac-Toe!'
        game.start
      end

      it "sends the gameboard" do
        output.should_receive(:puts).with("0 0 0 0 0 0 0 0 0")
        game.start
      end
      it "asks for a position" do
        output.should_receive(:puts).with("Choose a position: ")
        game.start
      end
    end

    describe "#mark" do
      context "when the gameboard is empty" do
        it "marks the 1st position" do
          output.should_receive(:puts).with("X 0 0 0 0 0 0 0 0")
          game.start
          game.position(1)
        end

        it "marks the 5th position" do
          output.should_receive(:puts).with("0 0 0 0 X 0 0 0 0")
          game.start
          game.position(5)
        end
      end
    end
  end
end
