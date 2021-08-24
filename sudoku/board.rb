require_relative "tile"


class Board
    
    def self.from_file(file_name)
        str_arr = File.readlines(file_name).map(&:chomp)
        int_arr = str_arr.map{ |chars| chars.split("").map(&:to_i) }
        tiles_arr = int_arr.map do |row| 
            row.map do |el| 
                    Tile.new(el, el != 0)
                end
            end
            
        end
    end
    
    def initialize(grid)
        @grid = grid
    end



end