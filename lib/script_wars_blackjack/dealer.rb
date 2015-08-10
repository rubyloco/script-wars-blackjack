module ScriptWarsBlackjack
  class Dealer
    extend Forwardable
    attr_reader :players, :deck, :hand
    def_delegator :@hand, :deal

    def initialize
      @players = []
      @deck = Deck.standard
      @hand = Hand.new
    end

    def add_player(name, bank = 1000)
      @players << Player.new(name, bank)
    end

    def valid_table?
      players_not_bust.count > 1
    end

    def winner
      players_not_bust.first
    end

    def players_not_bust
      @players.reject(&:bust?)
    end

    def best_hand
      hand.values.min
    end

    def reset_deck
      @deck = Deck.standard
    end

    def reset_hand
      @hand = Hand.new
    end

    def name
      'The Dealer'
    end
  end
end
