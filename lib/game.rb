require_relative '../player'

class GameOver < RuntimeError
end

def plural(x)
  if x == 1 then return x.to_s + " cake"
  else return x.to_s + " cakes" end
end

def game(n)
  cakes = n
  if cakes <= 0 then raise "At least one cake required" end
  new_player = Player.new(cakes)
  
  first = new_player.firstmove(cakes)
  last = 0
  puts plural(cakes) + " on the table. You decided to move " + (first ? "first" : "last")
  
  while true
  
    if !first then
      allow = []
      for i in 1..3
        if cakes >= i && i != last
          allow << i
        end
      end
      raise GameOver, "Stalemate" if allow.length == 0
      last = allow.sample
      cakes -= last
      if cakes == 0
        puts "Yum! I ate the last cake, you win!"
        return true
      end
      puts "I ate " + plural(last) + ", " + plural(cakes) + " still left." 
    else
      first = false
    end
    
    if cakes == 1 && last == 1
      puts "I lead you to stalemate, so you are winner."
      return true
    end
    move = new_player.move(cakes, last)
    raise "You are so greedy! Don't try to eat more than 3 cakes." if move > 4
    raise "Illegal move (must be 1, 2 or 3, type Number)" if !([1,2,3].include? move)
    raise "You cannot eat the same quantity of cakes as you opponent on previous move" if move == last
    raise "Don't try to eat more cakes that left on table" if move > cakes
    raise GameOver, "You ate the last cake!" if move == cakes
    cakes -= move
    last = move
    puts "You ate " + plural(move) + ", " + plural(cakes) + " still left."
  end
end