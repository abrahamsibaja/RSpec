system('clear')
require 'spec_helper'

module Tictactoe
  describe Display do
    let(:output) {double('output').as_null_object}
    let(:display) {Display.new(output)}

    def puts? message
      output.should_receive(:puts).with(message)
    end

    def fill_board positions
      (0..positions.length-1).each do |i|
        game.position_to_mark(positions[i].to_i)
        game.change_player
      end
      game.display.print_gameboard game.board
    end

    describe "#game_intro" do
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
        display.print_gameboard display.game.board
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
