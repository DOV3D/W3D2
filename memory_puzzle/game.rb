require_relative "board"
require_relative "card"
require_relative "human_player"

class Game
  def initialize(player=HumanPlayer.new)
    @board = Board.new
    @previous_guess = nil
    @player = player
  end

  def play
    until over?
      @board.render
      moves = @board.get_valid_moves
      pos = @player.get_input(moves)
      until moves.include?(pos)
        puts "Please enter a valid move"
        pos = @player.get_input(moves)
      end
      make_guess(pos)
    end
    puts "You won!"
  end

  def make_guess(pos)
    if @previous_guess.nil?
      @previous_guess = pos
      @board[pos].reveal
    else
      if @board[@previous_guess] == @board[pos]
        @board[pos].reveal
        puts "You got a match!"
        sleep(1)
        @previous_guess = nil
      else
        @board[pos].reveal
        @board.render
        sleep(2)
        @board[pos].hide
        @board[@previous_guess].hide
        @previous_guess = nil
      end
    end
  end

  def over?
    @board.won?
  end
end
