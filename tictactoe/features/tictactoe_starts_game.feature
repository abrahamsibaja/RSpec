Feature: tictactoe starts game

  As a player
  I want to start the game
  So I can play

  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see a welcome message "Welcome to Tic-Tac-Toe!"
    And I should see the game instructions "Every turn you play, you must choose a position number from the gameboard:"
    And I should see instructions gameboard line 1 "1 2 3"
    And I should see instructions gameboard line 2 "4 5 6"
    And I should see instructions gameboard line 3 "7 8 9"
    And I should see the gameboard current state message "The current state of the gameboard is:"
    And I should see gameboard line 1 "0 0 0"
    And I should see gameboard line 2 "0 0 0"
    And I should see gameboard line 3 "0 0 0"
    And I should see a choose a position message "Choose a position: "
