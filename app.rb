require 'bundler'
Bundler.require 

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josie")
player2 = Player.new("José")
player3 = HumanPlayer.new("Orane")

def intro(a, b)
    a.show_state
    b.show_state
end

def start
    puts "Let's play"
end

def fight(a, b)
    while a.life_points > 0 && b.life_points > 0
    a.attacks(b)
    if b.life_points <= 0 
        break
    end
    b.attacks(a)
    end
end



def playin(a, b)

        intro(a, b) 
        start
        fight(a, b)

end

p playin(player1, player2)


binding.pry






