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

Given(/^I started the game$/) do
end

When(/^I start a new game$/) do
  game = Tictactoe::Game.new(output)
  game.start
end

When(/^I choose "([^"]*)"$/) do |position|
  game = Tictactoe::Game.new(output)
  game.start
  game.position(position)
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

Then(/^the gameboard should be "([^"]*)"$/) do |gameboard|
  output.messages.should include(gameboard)
end
