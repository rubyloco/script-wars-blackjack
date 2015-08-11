module ScriptWarsBlackjack
  module Players
    class KevinKirsche
      def place_bet(state)
        current_player_bank = state.turn_player.bank
        if current_player_bank > 1_000_000_000
          current_player_bank / 2
        elsif current_player_bank > 500_000_000
          current_player_bank / 3
        elsif current_player_bank > 100_000_000
          current_player_bank / 4
        else
          current_player_bank / 5
        end
      end

      def take_turn(state)
        # current player hand
        hand_value = state.turn_player.hand.values.inject { |a, e| a + e }
        hand =  card_names state.turn_player.hand.cards
        hand = replace_values hand
        # dealer hand
        dealer_cards = card_names state.dealer_hand.cards
        dealer_high_card = replace_values(dealer_cards).max

        if hand_value == 21
          :stand
        elsif hand_value == 12 && ([4..6].include? dealer_high_card)
          :stand
        elsif hand_value == 13 && ([2..6].include? dealer_high_card)
          :stand
        elsif hand_value == 14 && ([2..6].include? dealer_high_card)
          :stand
        elsif hand_value == 15 && ([2..6].include? dealer_high_card)
          :stand
        elsif hand_value == 17 && ([2..10].include? dealer_high_card)
          :stand
        elsif hand_value == 17 && ([2..11].include? dealer_high_card)
          :stand
        elsif hand.sort == [7, 11] && ([2..8].include? dealer_high_card)
          :stand
        elsif hand.sort == [8, 11]
          :stand
        elsif hand.sort == [9, 11]
          :stand
        else
          :hit
        end
      end

      def replace_values(cards_array)
        cards_array.collect do |card|
          if card == :jack || card == :queen || card == :king
            10
          elsif card == :ace
            11
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
