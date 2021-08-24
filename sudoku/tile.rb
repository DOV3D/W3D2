class Tile
    attr_reader :value, :given
    
    def initialize(value, given)
        @value = value
        @given = given
    end

    def value=(value)
        unless given
            @value = value
        end
    end

    def to_s
        @value
    end

end