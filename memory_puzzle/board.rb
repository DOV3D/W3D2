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
        (system "clear")
        puts "  0 1 2 3"
        @grid.each.with_index do |row, i|
            print "#{i} "
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
        arr.each_slice(4).to_a
    end

    def reveal_card(pos)
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
    def get_valid_moves
        moves = []
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
               moves << [i,j] unless @grid[i][j].face_up
            end
        end
        moves
    end

end
