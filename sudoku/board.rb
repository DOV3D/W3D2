require_relative "tile"

class Board
    TOTAL = 45

    def self.from_file(file_name)
        str_arr = File.readlines(file_name).map(&:chomp)
        int_arr = str_arr.map{ |chars| chars.split("").map(&:to_i) }
        tiles_arr = int_arr.map do |row|
            row.map do |el|
                Tile.new(el, el != 0)
            end
        end
    end

    def initialize(grid)
        @grid = grid
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def render
        @grid.each do |row|
            row.each do |tile|
                print "#{tile} "
            end
            puts
        end
    end

    def rows_solved?
        @grid.all? do |row|
            int_row = row.map(&:value)
            int_row.uniq.length == 9 && int_row.min == 1 && int_row.max == 9
        end
    end

    def cols_solved?
        @grid.transpose.all? do |col|
            int_col = col.map(&:value)
            int_col.uniq.length == 9 && int_col.min == 1 && int_col.max == 9
        end
    end

    def square_solved?(start1, start2)
        arr = []
        (start1..start1+2).each do |i|
            (start2..start2+2).each do |j|
                arr << @grid[i][j].value
            end
        end
        p arr
        arr.uniq.length == 9 && arr.min == 1 && arr.max == 9
    end

    def all_squares_solved?
        (0..6).step(3) do |i|
            (0..6).step(3) do |j|
                return false unless square_solved?(i,j)
            end
        end
        true
    end

    def solved?
        rows_solved? && cols_solved? && all_squares_solved?
    end

end
