class Dealer
  attr_reader :players

  def initialize
    @players = []
  end

  def add_player(name)
    @players << name
  end
end
