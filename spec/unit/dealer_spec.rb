require 'spec_helper'

RSpec.describe ScriptWarsBlackjack::Dealer do
  subject { described_class.new }

  it "adds players" do
    subject.add_player 'Chris'
    subject.add_player 'Hunter'

    expect(subject.players.map(&:name)).to eq(['Chris', 'Hunter'])
  end

  it "has a deck" do
    expect(subject.deck).to be_a ScriptWarsBlackjack::Deck
  end

  it "has a hand" do
    expect(subject.hand).to be_a ScriptWarsBlackjack::Hand
  end

  it "knows that the best hand is 0 on initialization" do
    expect(subject.best_hand).to eq 0
  end

  it "a deck which has been reset should be different than before" do
    deck1 = subject.deck
    deck2 = subject.reset_deck
    expect(deck1.compare(deck2)).to eq false
  end

  it "a hand which has been reset should be different than before" do
    hand1 = subject.hand
    hand2 = subject.reset_hand
    expect(hand1 == hand2).to eq false
  end

  it "a subject should have a name" do
    expect(subject.name).to eq 'The Dealer'
  end

  it "keeps track of non bust players" do
    subject.add_player 'The House', 1000
    subject.add_player 'You', 0

    expect(subject.players_not_bust.map(&:name)).to match_array(['The House'])
  end

  it "invalidates itself if only one player remains" do
    subject.add_player 'The House', 1000
    subject.add_player 'You', 0

    expect(subject.valid_table?).to eq(false)
    expect(subject.winner.name).to eq('The House')
  end
end
