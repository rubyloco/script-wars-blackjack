require 'hand'

RSpec.describe Dealer do
  it "10, King is 20" do
    hand = Hand.new

    hand.deal Card.new(10)
    hand.deal Card.new(:king)

    expect(hand.values).to eq([20])
  end

  it '2, Ace is [3, 13]' do
    hand = Hand.new

    hand.deal Card.new(2)
    hand.deal Card.new(:ace)

    expect(hand.values).to eq([3, 13])
  end

  it '4, Ace, Ace is [6, 16, 26]' do
    hand = Hand.new

    hand.deal Card.new(4)
    hand.deal Card.new(:ace)
    hand.deal Card.new(:ace)

    expect(hand.values).to eq([6, 16, 26])
  end
end
