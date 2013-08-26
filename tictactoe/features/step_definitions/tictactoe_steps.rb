system('clear')
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
  display = Tictactoe::Display.new(output)
  display.welcome_message
  display.game_instructions
  display.print_gameboard(display.gameboard)
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
  display = Tictactoe::Display.new(output)
  display.gameboard.position_to_mark(position,'X')
  display.print_gameboard display.gameboard
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

#win game
Given(/^I have three marks in a row, column or diagonal$/) do
end

When(/^the gameboard is "([^"]*)"$/) do |gameboard|
  display = Tictactoe::Display.new(output)
  (0..8).each {|i| display.gameboard.cells[i] = gameboard[i]}
  display.game.verify_victory
  display.winner_message(display.game.winner)
end

Then(/^I should see a congrats message "([^"]*)"$/) do |congrats_message|
  output.messages.should include(congrats_message)
end
