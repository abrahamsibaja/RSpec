class Output
  def messages
    @messages ||= []
  end

  def puts message
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  gameboard = GameBoard.new
  display = Tictactoe::Display.new(output, gameboard)
  display.welcome_message
  display.game_instructions
  display.print_gameboard gameboard
  display.position_message
end

Then(/^I should see a welcome message "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see the game instructions "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see instructions gameboard line 1 "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see instructions gameboard line 2 "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see instructions gameboard line 3 "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see the gameboard current state message "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see gameboard line 1 "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see gameboard line 2 "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see gameboard line 3 "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see a choose a position message "([^"]*)"$/) do |position_message|
  output.messages.should include(position_message)
end

# mark a cell
Given(/^I started the game$/) do
end

When(/^I choose "([^"]*)"$/) do |position|
  game = Tictactoe::Game.new(output)
  game.position_to_mark(position)
  game.display.print_gameboard game.board
end

Then(/^the gameboard line1 should be "([^"]*)"$/) do |gameboard1|
  output.messages.should include(gameboard1)
end

Then(/^the gameboard line2 should be "([^"]*)"$/) do |gameboard2|
  output.messages.should include(gameboard2)
end

Then(/^the gameboard line3 should be "([^"]*)"$/) do |gameboard3|
  output.messages.should include(gameboard3)
end

Given(/^I have three marks in a row, column or diagonal$/) do
end

When(/^the gameboard is "([^"]*)"$/) do |gameboard|
  game = Tictactoe::Game.new(output)
  (0..8).each {|i| game.board.cells[i] = gameboard[i]}
  game.verify_victory
end

Then(/^I should see a congrats message "([^"]*)"$/) do |congrats_message|
  output.messages.should include(congrats_message)
end
