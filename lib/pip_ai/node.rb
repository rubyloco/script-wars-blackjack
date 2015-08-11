module ScriptWarsBlackjack
  module PipAI
    class CardNode
      def initialize(value)
        @value = value
        @wins = 0
        @losses = 0
        @children = Hash.new
      end

      def win_ratio
        1 if @losses == 0
        @wins / @losses
      end

      def win
        @wins += 1
      end

      def lose
        @losses += 1
      end

      def stand?
        win_ratio > 0.25
      end
    end
  end
end