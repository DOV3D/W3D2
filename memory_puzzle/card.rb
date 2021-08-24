class Card
  attr_reader :value, :face_up

  def initialize(value, face_up=false)
    @value = value
    @face_up = face_up
  end

  def display
    if @face_up
      return @value
    else
      return " "
    end
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @value
  end

  def ==(other_card)
    self.value == other_card.value
  end

end
