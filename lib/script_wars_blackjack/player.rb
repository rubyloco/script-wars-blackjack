module ScriptWarsBlackjack
  class Player
    VALID_MOVES = %i[hit stand]

    extend Forwardable
    attr_reader :name, :bank, :hand, :current_bet
    def_delegator :@hand, :deal

    def initialize(name, bank)
      @name = name
      @bank = bank
      @hand = Hand.new
    end

    def clone
      Marshal.load(Marshal.dump(self))
    end

    def bust?
      @bank <= 0
    end

    def ai_class
      Players.const_get(@name)
    end

    def make_bet(player_state)
      ai = ai_class.new
      potential_bet = ai.place_bet(player_state)
      if potential_bet < @bank
        @current_bet = potential_bet
      else
        @current_bet = @bank
      end
    end

    def take_turn(player_state)
      ai = ai_class.new
      move = ai.take_turn(player_state)

      fail ScriptWarsBlackjack::InvalidMoveError,
           "#{move} is an invalid move" unless VALID_MOVES.include?(move)

      move
    end

    def forfit_bet
      @bank -= @current_bet
      @current_bet = 0
    end

    def win_bet
      @bank += @current_bet * 2
      @current_bet = 0
    end

    def reset_hand
      @hand = Hand.new
    end

    def best_hand
      @hand.values.select { |v| v <= 21 }.max
    end
  end
end
