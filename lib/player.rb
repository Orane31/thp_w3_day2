class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name 
        @life_points = 10
    end

# Afficher l'état de l'objet Player sur laquelle elle est exécutée : "XXXX a YYY points de vie".
    def show_state
        return "#{@name} has #{@life_points} left !"
    end

# Le joueur stocké dans l'objet player1 subit 5 pts de dommage en faisant un player1.gets_damage(5).
    def gets_damage(pts_taken)
        @pts_taken = pts_taken
        @life_points = @life_points - @pts_taken
        if @life_points <= 0
            puts "#{@name} is dead !"
            @life_points = 0
        end
        return @life_points
    end

# Pour que le player1 attaque le player2, on aura juste à taper player1.attacks(player2).
    def attacks(attacked)
        puts "Player #{self.name} is attacking player #{attacked.name} !"
        pts_taken = compute_damage
        puts "#{attacked.name} lost #{pts_taken} life points ! \n"
        attacked.gets_damage(pts_taken)
    end

    def compute_damage
        return rand(1..6)
    end

end

# Nouvelle classe = HumanPlayer avec 100 pts de vie et une arme = weapon

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @life_points = 100
        @weapon_level = 1
        super(name)
    end

    def show_state
        return "#{@name} has #{@life_points} left, and their weapon is of level #{@weapon_level} !"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end
# mèthode search weapon : si l'arme est meilleure, on la garde

    def search_weapon
        @better_weapon = rand(1..6)
        puts "You have found a weapon of level #{@better_weapon}"
        
        if @better_weapon > @weapon_level
            @weapon_level = @better_weapon
            puts "Yuhuuuuu ! You now have a level #{@weapon_level} weapon !"
        else
            puts "It's not better than your current weapon... No use in keeping it."
        end
    end

# méthode search life pack : pour regagner des points de vie 

    def search_health_pack
        @pts_found = rand(1..6)

        case @pts_found

        when 1
            puts "Couldn't find anything"

        when 2..5
            @points_total = @life_points + 50
            if @points_total > 100
                @life_points = 100
            else
                @life_points = @points_total
            end
            puts "Yeeeeeeah you found a pack of +50 life points !"

        when 6
            @points_total = @life_points + 80
            if @points_total > 100
                @life_points = 100
            else
                @life_points = @points_total
            end
            puts "OMG you found a pack of +80 life points !"   
        end
    end

end