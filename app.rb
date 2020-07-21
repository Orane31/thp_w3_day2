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





p intro(player2, player1)














