require_relative 'board.rb'
require_relative 'card.rb'

class Game
  def intialize
    @board = Board.new
    @previous_guess = nil
  end

  def play
    until over?
      @board.render
      pos = prompt_player
      make_guess(pos)
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
        @board[@previous_guess].hide
      end
    end
  end

  def over?
    @board.won?
  end
end
