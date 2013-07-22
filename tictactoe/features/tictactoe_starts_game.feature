Feature: tictactoe starts game

  As a player
  I want to start the game
  So I can play

  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to Tic-Tac-Toe!"
