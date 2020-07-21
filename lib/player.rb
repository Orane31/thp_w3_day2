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