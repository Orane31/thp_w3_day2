class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name 
        @life_points = 10
    end


    def self.show_state
        return @life_points
    end

    def gets_damage
        @damage = damage
        @life_points = @life_points - @damage
        if @life_points <= 0
        return @life_points
        end
    end




end