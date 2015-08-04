class Card
  attr_reader :name

  FACE_CARDS = %i(king queen jack)

  def initialize(name)
    @name = name
  end

  def values
    if FACE_CARDS.include? name
      [10]
    elsif name == :ace
      [1, 11]
    else
      [name.to_i]
    end
  end
end
