require "byebug"
class ComputerPlayer
    def initialize
        @known_cards = Hash.new { |h,k| h[k] = [] }
        # Hash with key: letter, value = positions [[0,0]]
        @next_move = nil
        @matched_cards = []
    end

    def receive_match(letter)
        @matched_cards << letter
    end

    def receive_revealed_card(pos, letter)
        @known_cards[letter] << pos unless @known_cards[letter].length == 2
    end

    def get_input(moves, previous_guess, letter)
        ##debugger
        if previous_guess
            #debugger
            if @next_move
                #debugger
                return @next_move
            elsif @known_cards[letter].length == 2
                #debugger
                return @known_cards[letter][0]
            else
                #debugger
                return (moves-@known_cards.values.flatten(1)).sample
            end
        else
            #debugger
            @next_move = nil
            @known_cards.each do |letter, positions|
                #debugger
                if !@matched_cards.include?(letter) && positions.length == 2
                    #debugger
                    @next_move = positions[1]
                    return positions[0]
                end
            end
            #debugger
            return (moves-@known_cards.values.flatten(1)).sample
        end
    end

end
