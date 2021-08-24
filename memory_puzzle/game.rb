require_relative "board"
require_relative "card"
require_relative "human_player"

class Game
  def initialize
    @board = Board.new
    @previous_guess = nil
    @player = HumanPlayer.new
  end

  def play
    until over?
      (system "clear")
      @board.render
      move = @board.get_valid_moves
       pos = @player.prompt
      until move.include?(pos)
        pos = @player.prompt
      end
      make_guess(pos)
    end
  end

  def make_guess(pos)
    if @previous_guess.nil?
      @previous_guess = pos
      @board[pos].reveal
    else
      if @board[@previous_guess] == @board[pos]
        @board[pos].reveal
        puts "You got a match!"
        @previous_guess = nil
      else
        (system "clear")
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
