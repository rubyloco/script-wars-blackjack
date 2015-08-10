module ScriptWarsBlackjack
  module Players
    # DirkAi - By dlink87

    class DirkAi
      def place_bet(player)
        500
      end

      def take_turn(state)
        if state.turn_player.hand.values.min < state.dealer_hand.values.min + 10
          :hit
        else
          :stand
        end
      end
    end
  end
end
