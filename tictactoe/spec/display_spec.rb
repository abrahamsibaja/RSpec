system('clear')
require 'spec_helper'

module Tictactoe
  describe Display do
    let(:output) {double('output').as_null_object}
    let(:display) {Display.new(output, GameBoard.new)}

    def puts? message
      output.should_receive(:puts).with(message)
    end

    describe "#start" do
      it "sends a welcome message" do
        puts? 'Welcome to Tic-Tac-Toe!'
        display.welcome_message
      end
      it "sends the game instructions" do
        puts? 'Every turn you play, you must choose a position number from the gameboard:'
        puts? '1 2 3'
        puts? '4 5 6'
        puts? '7 8 9'
        display.game_instructions
      end
      it "sends the gameboard" do
        output.should_receive(:puts).with("0 0 0")
        output.should_receive(:puts).with("0 0 0")
        output.should_receive(:puts).with("0 0 0")
        display.print_gameboard display.board
      end
    end

    describe "#make movement" do
      it "asks for a position" do
        output.should_receive(:puts).with("Choose a position: ")
        display.position_message
      end
    end

  end
end
