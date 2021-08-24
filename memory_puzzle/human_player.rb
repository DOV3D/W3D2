

class HumanPlayer

    def prompt
        puts "Enter a guess with a space like 3 1:"
        pos = gets.chomp.split.map(&:to_i)
    end

    def get_input(moves, previous_guess, letter)
        prompt
    end

    def receive_revealed_card(pos, val)
    end

end
