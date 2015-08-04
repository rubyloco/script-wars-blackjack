class Player
  attr_reader :name, :bank

  def initialize(name, bank)
    @name = name
    @bank = BigDecimal.new(bank)
  end
end
