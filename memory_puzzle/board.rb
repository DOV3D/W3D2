require_relative "card"

class Board
    def initialize
        @grid = populate
    end

    def won?
        @grid.all? do |row| 
            row.all? {|card| card.face_up}
        end
    end

    def render
        @grid.each do |row|
            row.each do |card|
                print card.display + " "
            end
            puts
        end
    end

    def populate
        alphabet = ("A".."H").to_a
        arr = []
        8.times do |i|
            arr << Card.new(alphabet[i])
            arr << Card.new(alphabet[i])
        end

        arr.shuffle!
        grid = []
        4.times do |i|
            grid << arr[4*i...4*(i+1)]
        end
        grid
    end

    def reveal(pos)
        self[pos].reveal
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end
    # def []=(pos, val)
    #     row, col = pos
    #     @grid[row][col] = val
    # end

end