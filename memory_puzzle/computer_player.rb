class ComputerPlayer
    def initialize
        @known_cards = {}
        @matched_cards
    end

    def receive_revealed_card(pos, val)
        @known_cards[val]= pos unless @known_cards.include?(val)
    end

    def get_input(moves)

    end

end
