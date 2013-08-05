Feature: tictactoe mark cell

  The player chooses the position in which he wants to play. The game marks
  the position with an X.

  Scenario Outline: mark a cell
    Given I started the game
    When I choose "<position>"
    Then the gameboard line1 should be "<gameboard1>"
    Then the gameboard line2 should be "<gameboard2>"
    Then the gameboard line3 should be "<gameboard3>"

    Scenarios: The gameboard is empty
      | position | gameboard1 | gameboard2 | gameboard3 |
      | 1        | X 0 0      | 0 0 0      | 0 0 0      |
      | 5        | 0 0 0      | 0 X 0      | 0 0 0      |
      | 9        | 0 0 0      | 0 0 0      | 0 0 X      |
