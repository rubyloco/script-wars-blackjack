require 'deck'

RSpec.describe Deck do
  it "builds a standard deck of 52" do
    deck = Deck.standard
    expect(deck.cards.length).to eq(52)
  end
end
