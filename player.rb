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