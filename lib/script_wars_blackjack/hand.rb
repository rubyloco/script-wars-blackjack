module ScriptWarsBlackjack
  class Hand
    attr_reader :cards

    def initialize
      @cards = []
    end

    def deal(card)
      @cards << card
    end

    def values
      @cards.inject([0]) { |memo, card| add(memo, card.values) }
    end

    def over?(value = 21)
      values.any? { |value| value > 21 }
    end

    def clone
      Marshal.load(Marshal.dump(self))
    end

    private
    
    def add(values1, values2)
      values = []
      values1.each do |v1|
        values2.each do |v2|
          values << v1 + v2
        end
      end

      values.uniq
    end
  end
end
