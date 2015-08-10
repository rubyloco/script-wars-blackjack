module ScriptWarsBlackjack
  module Players
    class SampleAlwaysStand
      def place_bet(_player)
        1000
      end

      def take_turn(_player)
        :stand
      end
    end
  end
end
