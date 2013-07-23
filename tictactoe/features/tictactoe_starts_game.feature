Feature: tictactoe starts game

  As a player
  I want to start the game
  So I can play

  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see a welcome message "Welcome to Tic-Tac-Toe!"
    And I should see a gameboard "0 0 0 0 0 0 0 0 0"
    And I should see a choose a position message "Choose a position: "
