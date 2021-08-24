class ComputerPlayer
    def initialize
        @known_cards = Hash.new { |h,k| h[k] = [] }
        # Hash with key: letter, value = positions [[0,0]]
        @next_move = nil
    end

    def receive_revealed_card(pos, letter)
        @known_cards[letter] << pos unless @known_cards.include?(letter)
    end

    def get_input(moves, previous_guess, letter)
        if previous_guess
            if @next_move
                return @next_move
            elsif @known_cards[letter].length == 2
                return @known_cards[letter][0]
            else
                return moves.sample
            end
        else
            @next_move = nil
            @known_cards.each do |letter, positions|
                if positions.length == 2
                    @next_move = positions[1]
                    return positions[0]
                end
            end
            return moves.sample
        end
    end

end
