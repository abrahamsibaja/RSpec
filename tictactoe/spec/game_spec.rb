system('clear')
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
        game.game_intro
      end

      it "sends the gameboard" do
        output.should_receive(:puts).with("0 0 0 0 0 0 0 0 0")
        game.game_intro
      end
    end

    describe "#mark a position" do
      context "when the gameboard is empty" do
        it "asks for a position" do
          output.should_receive(:puts).with("Choose a position: ")
          game.play
        end
        it "marks position: 1" do
          output.should_receive(:puts).with("X 0 0 0 0 0 0 0 0")
          game.position(1)
        end

        it "marks position: 5" do
          output.should_receive(:puts).with("0 0 0 0 X 0 0 0 0")
          game.position(5)
        end
      end
      context "when there is 1 position marked" do
        context "marked position: 1" do
          it "marks position: 3" do
            output.should_receive(:puts).with("X 0 Y 0 0 0 0 0 0")
            game.position(1)
            game.change_player
            game.position(3)
          end
          it "marks position: 6" do
            output.should_receive(:puts).with("X 0 0 0 0 Y 0 0 0")
            game.position(1)
            game.change_player
            game.position(6)
          end
        end
      end
      context "when there are 2 positions marked" do
        context "marked positions: 1,5" do
          it "marks position 3" do
            output.should_receive(:puts).with("X 0 X 0 Y 0 0 0 0")
            game.position(1)
            game.change_player
            game.position(5)
            game.change_player
            game.position(3)
          end
        end
      end
    end
  end
end
