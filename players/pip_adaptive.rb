require "yaml"
require 'pip_ai/node'

=begin
Blackjack AI (Adaptive 1)
---------------------

This AI (Adaptive 1) only makes decisions based on it's own cards, ignoring the dealer completely other than to hit or stand.

Method: Each iteration, the AI references a tree of old hands to see whether to hit, stand, or split (split not implemented).

Hand storage tree:

	root
    	/  \
       A    2 ....
      / \ ....
     A   2

Each node has a hash of children, as well as containing a win number and loss number. Children will automatically be created if the hand has never been played.

Rules:
If the hand has never been played, stand.
If the win ratio (win number/loss number) is high, stand.
Else, hit.

Possible extra strategies: check avg. win ratio of children, if it is higher then hit.
=end

module ScriptWarsBlackjack
  module Players
    # Pip - By user

    class Pip
      include PipAI

      def initialize()
        @storage_path = File.expand_path("../pip_adaptive_1_storage.yml", __FILE__)
        @data = {}
        save_data(@storage_path)
        File.new(@storage_path) unless File.exists?(@storage_path)
        load_data(@storage_path)
      end

      def load_data(yml_file)
        @data = YAML.load(File.open(yml_file))
      end

      def save_data(yml_file)
        File.open(yml_file, "w") do |file|
          file.write(@data.to_yaml)
        end
      end

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
