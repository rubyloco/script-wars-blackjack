module ScriptWarsBlackjack
  module Players
    class SampleAlwaysStand

      def place_bet(player)
        1000
      end

      def take_turn(player)
        :stand
      end

    end
  end
end
