# The Poison Cake

Inside a room, there is a table with a pile of cakes. One of these cakes is filled with poison. Every turn, we will take cakes from this pile and eat them, leaving the last one to be the poisonous cake. Whoever eats the poisonous cake will die. The poisonous cake is clearly marked, so you do not have to guess. Rather you need to rely on your logic to save you.

## The rules are simple:

1. Do not eat the last cake. It's obivious that poisonous cake will be the last to be eaten, so, don't eat the poison cake! Try to make your opponent eat it.
2. When it is your turn, you can only take one, two or three cakes. The same rules apply to your opponent on there turn. You cannot skip your move, so choose wisely how many cakes to eat. Both opponents will be able to see how many cakes the other eats on each turn.
3. You cannot copy your opponent's previous move, likewise they cannot copy yours. If your opponent takes one cake, next move you can only choose between two or three. If you take three cakes, your opponent can only choose one or two. This doesn't effect the first move, only to subsequent.
4. If one of the players has no valid moves (e.g one cake left and previous move was one cake), that player will lose his turn and be skipped. Then the other player will be forced to eat the last cake. This is the only case of turn skipping.
5. You can choose whether or not to go first. This decision is key to victory, so don't hurry, choose wisely!
6. You may only make changes to ```player.rb```.
7. Run ```$ bundle install``` to set up the environment.
8. Run ```$ bundle exec rspec``` to run the tests.

## Task of this puzzle:

To solve this puzzle, you should write class called Player. This class has one constructor and two other functions:

```
class Player
  # called at the beginning of each game. Parameter: a number of cakes on table.
  def initialize(cakes)
  end
  # called after constructor.
  # Parameter: number of cakes on table left (same as in constructor).
  # Must return true if you want to move first, false is you want to move after your opponent.
  def firstmove(cakes)
  end
  # called before each of your moves.
  # First parameter: number of cakes left on table.
  # Second parameter: amount of cakes took by your opponent last move.
  # Must return 1, 2 or 3 depending of how much cakes you want to take.  
  def move(cakes, last)
    last == 1 ? 2 : 1 # I'm not greedy
  end
end
```

Each test is a different game and different instance of the Player class. You should not worry about calling functions, you should only watch the number of cakes on table and decide on every move how many to take, and decide who moves first.

Write your Player class and beat your opponent! You must figure out a strategy that can guarantee you a victory.

## Example:

```
class Player
  def initialize(cakes)
  end
  # Decide who move first - player or opponent (return true if player)
  def firstmove(cakes)
    true # I want to move first
  end
  # Decide your next move (return 1, 2 or 3)
  def move(cakes, last)
    last == 1 ? 2 : 1 # I'm not greedy
  end
end
```

## Example of game:
```
12 cakes on the table. You decided to move first.

You ate 1 cake, 11 cakes left

Opponent ate 3 cakes, 8 cakes left

You ate 2 cakes, 6 cakes left

Opponent ate 1 cake, 5 cakes left

You ate 3 cakes, 2 cakes left

Opponent has no winning choice. If he eats 2 cakes, he will lose. If he eats 1 cake, you will be left in stalemate situation, and he will again eat 1 cake and lose.

You win.
```