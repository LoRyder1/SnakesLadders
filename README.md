http://agilekatas.co.uk/katas/SnakesAndLadders-Kata

Snakes and Ladders Kata
Snakes and Ladders is a board game involving two or more players rolling dice in order to move their tokens across a board. The board is made up of a collection of numbered squares and is adorned with 'snakes' and 'ladders', which link two squares on the board- snakes link the squares downwards whilst ladders link them going upwards. This means that landing at the bottom of a ladder moves you to the top of that ladder, whereas landing on the top of a snake moves you to the bottom of that snake. The objective of the game is to get your token to the final square before your opponents do.

From a technical point of view, the implementation of this game needs to be platform agnostic. We are going to want to launch this game on multiple devices and need a solid, robust game library which we can use as the backend for every frontend we stick on it. For this reason, we are not interested in the frontend you choose to use to test the game, only that the core game logic is separate and tested.


Feature 1 - Moving Your Token
The first feature we want implemented is the ability to move your token across the board using dice rolls. Players will need the ability to roll a dice, move their token the number of squares indicated by the dice roll and should win if they land on the final square.

Token Can Move Across the Board
As a player
I want to be able to move my token
So that I can get closer to the goal