module ScriptWarsBlackjack
  module Players
    class Sample

      def place_bet(state)
        1000
      end

      def take_turn(state)
        if state.turn_player.hand.values.min < 15
          :hit
        else
          :stand
        end
      end

    end
  end
end
