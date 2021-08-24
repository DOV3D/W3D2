require_relative "board"
require_relative "card"

class Game
  def initialize
    @board = Board.new
    @previous_guess = nil
  end

  def play
    until over?
      @board.render
      pos = prompt_player
      make_guess(pos)
      (system "clear")
    end
  end

  def prompt_player
    puts "Enter a guess with a space like 3 1:"
    pos = gets.chomp.split.map(&:to_i)
  end

  # [0,0]

  def make_guess(pos)
    if @previous_guess.nil?
      @previous_guess = pos
      @board[pos].reveal
    else
      if @board[@previous_guess] == @board[pos]
        @board[pos].reveal
        puts "You got a match!"
      else
        (system "clear")
        @board[pos].reveal
        @board.render
        sleep(2)
        @board[pos].hide
        @board[@previous_guess].hide
      end
    end
  end

  def over?
    @board.won?
  end
end
