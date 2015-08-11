require 'pip_ai/node'
module ScriptWarsBlackjack
  module Players
    # Pip - By user

    class Pip
      include PipAI
      def place_bet(game_state)
        # Return your integer bet
        0
      end

      def take_turn(game_state)
        # Current player's hand
        hand_value = game_state.turn_player.hand.values.inject { |a, e| a + e }
        hand = card_names game_state.turn_player.hand.cards
        hand = replace_values hand
        # Dealer's hand
        dealer_cards = card_names game_state.dealer_hand.cards
        dealer_high_card = replace_values(dealer_cards).max

        # Return either :hit or :stand
        :stand
      end

      # replace_values and card_names originally copied from kkirsche_basic_strategy.rb
      def replace_values(cards_array, soft_aces = false)
        cards_array.collect do |card|
          if card == :jack || card == :queen || card == :king
            10
          elsif card == :ace
            if soft_aces
              1
            else
              11
            end
          else
            card
          end
        end
      end

      def card_names(hand)
        hand.map { |card| card.name }
      end
    end
  end
end
