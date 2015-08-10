module ScriptWarsBlackjack
  class GameState
    attr_reader :dealer_hand, :turn_player

    def initialize(turn_player, dealer_hand)
      @turn_player = turn_player
      @dealer_hand = dealer_hand
    end
  end
end
