module ScriptWarsBlackjack
  class Player
    attr_reader :name, :bank

    def initialize(name, bank)
      @name = name
      @bank = bank
    end
  end
end
