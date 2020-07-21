require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "

    ██   ██ ██ ██      ██          ████████ ██   ██ ███████     ██████   █████   ██████  ██       ██████  ███████ 
    ██  ██  ██ ██      ██             ██    ██   ██ ██          ██   ██ ██   ██ ██    ██ ██      ██    ██ ██      
    █████   ██ ██      ██             ██    ███████ █████       ██████  ███████ ██    ██ ██      ██    ██ ███████ 
    ██  ██  ██ ██      ██             ██    ██   ██ ██          ██      ██   ██ ██    ██ ██      ██    ██      ██ 
    ██   ██ ██ ███████ ███████        ██    ██   ██ ███████     ██      ██   ██  ██████  ███████  ██████  ███████ 
                                                                                                              
                                                                                                              
"
puts "
                           ------------------------------------------------
                           |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
                           |Le but du jeu est d'être le dernier survivant !|
                           -------------------------------------------------
"
#puts "Bienvenue sur 'ILS VEULENT TOUS MA POO' ! \n Le but du jeu est d'être le dernier survivant !"

puts "What's your name ?"
name = gets.chomp
my_player = HumanPlayer.new(name)


ennemies = Array.new
paolo = Player.new("Paolo")
paula = Player.new("Paula")

ennemies << paolo
ennemies << paula

# boucle while qui ne s'arrête que si le HumanPlayer meurt 
# ou si les 2 Players meurent.  


while my_player.life_points > 0 && (paolo.life_points > 0 || paula.life_points > 0)
    
    puts my_player.show_state
    puts "What do you want to do ?"
    puts "1 - If you want to search for a better weapon,"
    puts "2 - If you want to try to regain some life points,"
    puts "\nIf you want to attack another player :"

if paolo.life_points > 0
    puts "#{paolo.show_state}"
    puts "Type 3 to attack #{paolo.name} "
    else
        puts "Bye bye #{paolo.name}"
end

if paula.life_points > 0 
    puts "#{paula.show_state}"
    puts "Type 4 to attack #{paula.name} "
    else
        puts "Bye bye #{paula.name}"
end


# Le choix est transformé en action pour le Human Player

    choice = gets.chomp.to_i

    case choice 
        when 1
            my_player.search_weapon
        when 2
            my_player.search_health_pack
        when 3
            my_player.attacks(paolo)
        when 4
            my_player.attacks(paula)
    end

# Malheureusement le Human player se fait aussi attaquer à chaque tour

# condition if pour n'annoncer l'attaque que si Hman player est encore en vie ou au moins un des deux bots
    if (paolo.life_points > 0 || paula.life_points > 0) && my_player.life_points > 0
        puts "Wait ! They're now attacking you !"
    end

# boucle each pour faire attaquer chaque bot tant qu'il est encore en vie
    ennemies.each {|ennemy| 
    if ennemy.life_points > 0 
    ennemy.attacks(my_player)
    end}
end

# Fin du jeu

if my_player.life_points > 0 
    puts "You are the winner !!!!"
else
    puts "You looooose sucker"
end

