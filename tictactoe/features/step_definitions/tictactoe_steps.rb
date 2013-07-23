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
  game.start
end

Then(/^I should see a welcome message "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

Then(/^I should see a gameboard "([^"]*)"$/) do |board|
  output.messages.should include(board)
end
