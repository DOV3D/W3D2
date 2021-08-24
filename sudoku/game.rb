require_relative "board"
require_relative "tile"

class Game

  def initialize
    @board
  end

  def over?
    @board.solved?
  end

  def play
    until over?
      @board.render

    end
  end
end
