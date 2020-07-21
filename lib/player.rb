class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name 
        @life_points = 10
    end

# Afficher l'état de l'objet Player sur laquelle elle est exécutée : "XXXX a YYY points de vie".
    def show_state
        puts "#{@name} has #{@life_points} left !"
    end

# Le joueur stocké dans l'objet player1 subit 5 pts de dommage en faisant un player1.gets_damage(5).
    def gets_damage(damage_pts)
        @damage_pts = damage_pts
        @life_points = @life_points - @damage_pts
        if @life_points <= 0
            puts "#{@name} is dead !"
        @life_points = 0
        end
    end

# Pour que le player1 attaque le player2, on aura juste à taper player1.attacks(player2).
    def attacks(attacked)
        puts "Player #{self.name} is attacking player #{attacked.name} !"
        attack = compute_damage
        attacked.gets_damage(attack)
        puts "#{attacked.name} lost #{attack} life points !"
    end

    def compute_damage
        return rand(1..6)
    end

end