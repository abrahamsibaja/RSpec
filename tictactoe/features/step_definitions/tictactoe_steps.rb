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
  game = Tictactoe::Game.new(output)
  game.welcome_message
  game.game_intro
end

Then(/^I should see a welcome message "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see a gameboard "([^"]*)"$/) do |board|
  output.messages.should include(board)
end

Then(/^I should see a choose a position message "([^"]*)"$/) do |position_message|
  output.messages.should include(position_message)
end

Given(/^I started the game$/) do
end

When(/^I choose "([^"]*)"$/) do |position|
  game = Tictactoe::Game.new(output)
  game.position(position)
end

Then(/^the gameboard should be "([^"]*)"$/) do |gameboard|
  output.messages.should include(gameboard)
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
