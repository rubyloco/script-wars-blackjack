module ScriptWarsBlackjack
  class Dealer
    attr_reader :players

    def initialize
      @players = []
    end

    def add_player(name)
      @players << Player.new(name, 1000)
    end
  end
end
