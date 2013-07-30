Feature: tictactoe win game

  As a player
  I want to win the game
  So I place three of my marks in a row, column or diagonal

  Scenario Outline: win game
    Given I have three marks in a row, column or diagonal
    When the gameboard is "<gameboard>"
    Then I should see a congrats message "Congratulations Player <player> you are the winner!!"

    Scenarios: I complete a horizontal line
      | gameboard | player |
      | XXXY0Y000 | X      |
      | 0Y0XXX00Y | X      |
      | YY0000XXX | X      |
    Scenarios: I complete a vertical line
      | gameboard | player |
      | XY0X00XY0 | X      |
      | YXY0X00X0 | X      |
      | 0YX0YX00X | X      |
    Scenarios: I complete a diagonal line
      | gameboard | player |
      | X0Y0X0Y0X | X      |
      | Y0X0X0X0Y | X      |
