require 'spec_helper'

RSpec.describe ScriptWarsBlackjack::Hand do
  it "10, King is 20" do
    hand = ScriptWarsBlackjack::Hand.new

    hand.deal ScriptWarsBlackjack::Card.new(10)
    hand.deal ScriptWarsBlackjack::Card.new(:king)

    expect(hand.values).to eq([20])
  end

  it '2, Ace is [3, 13]' do
    hand = ScriptWarsBlackjack::Hand.new

    hand.deal ScriptWarsBlackjack::Card.new(2)
    hand.deal ScriptWarsBlackjack::Card.new(:ace)

    expect(hand.values).to eq([3, 13])
  end

  it '4, Ace, Ace is [6, 16, 26]' do
    hand = ScriptWarsBlackjack::Hand.new

    hand.deal ScriptWarsBlackjack::Card.new(4)
    hand.deal ScriptWarsBlackjack::Card.new(:ace)
    hand.deal ScriptWarsBlackjack::Card.new(:ace)

    expect(hand.values).to eq([6, 16, 26])
  end
end
