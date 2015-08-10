module ScriptWarsBlackjack
  module Players
    # SuperAiMaybe - By GMAC
    class SuperAiMaybe

      def place_bet(game_state)
        500
      end

      def take_turn(game_state)
        if game_state.turn_player.hand.values.min < 13
          :hit
        else
          :flip_table
        end
      end

    end
  end
end
