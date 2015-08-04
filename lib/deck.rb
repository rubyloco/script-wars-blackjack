class Deck
  attr_accessor :cards

  def self.standard
    names = []

    4.times do
      names += [:ace, :king, :queen, :jack, 10, 9, 8, 7, 6, 5, 4, 3, 2]
    end

    Deck.new names
  end

  def initialize(names)
    @cards = names.map { |name| Card.new(name) }
  end
end
