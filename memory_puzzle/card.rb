class Card
  attr_reader :value

  def initialize(value, faceup=false)
    @value = value
    @faceup = faceup
  end

  def display
    if @faceup
      return @value
    else
      return ""
    end
  end

  def hide
    @faceup = false
  end

  def reveal
    @faceup = true
  end

  def to_s
    @value
  end

  def ==(other_card)
    self.value == other_card.value
  end

end
