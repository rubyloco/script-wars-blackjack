module ScriptWarsBlackjack
  class Player
    extend Forwardable
    attr_reader :name, :bank, :hand
    def_delegator :@hand, :deal

    def initialize(name, bank)
      @name = name
      @bank = bank
      @hand = Hand.new
    end

    def clone
      Marshal.load(Marshal.dump(self))
    end
  end
end
