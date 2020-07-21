require 'bundler'
Bundler.require 

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josie")
player2 = Player.new("José")

def intro(player1, player2)
    player1.show_state
    player2.show_state
end

def start
    puts "Let's play"
end

def fight(player1, player2)
    while player1.life_points > 0 || player2.life_points > 0
    player1.attacks(player2)
    puts "\n"
    if player2.life_points <= 0 
        break
    end
    player2.attacks(player1)
    end
end



def playin(player1, player2)

        intro(player1, player2) 
        start
        fight(player1, player2)

end

p playin(player1, player2)









