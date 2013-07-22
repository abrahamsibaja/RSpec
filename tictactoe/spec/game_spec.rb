require 'spec_helper'

module Tictactoe
  describe Game do
    describe "#start" do
      it "sends a welcome message" do
        output = double('output')
        game = Game.new(output)

        output.should_receive(:puts).with('Welcome to Tic-Tac-Toe!')

        game.start
      end
    end
  end
end
