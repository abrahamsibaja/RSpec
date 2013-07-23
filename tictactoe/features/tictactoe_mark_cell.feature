Feature: tictactoe mark cell

  The player chooses the position in which he wants to play. The game marks
  the position with an X.

  Scenario Outline: mark a cell
    Given I started the game
    When I choose "<position>"
    Then the board should be "<gameboard>"

    Scenarios: The gameboard is empty
      | position | gameboard           |
      | 1        | "1 0 0 0 0 0 0 0 0" |
