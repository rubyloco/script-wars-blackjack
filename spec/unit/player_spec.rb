RSpec.describe ScriptWarsBlackjack::Player do
  subject { described_class.new :Sample, 1000 }
  let(:bust_player) { described_class.new 'Sample', 0 }
  let(:card) { ScriptWarsBlackjack::Card.new(:king) }

  it "has a name, bank and hand" do
    expect(subject.name).to eq(:Sample)
    expect(subject.bank).to eq 1000
    expect(subject.hand).to be_a ScriptWarsBlackjack::Hand
  end

  it "delegates to hand to add cards" do
    subject.deal(card)
    expect(subject.hand.cards.count).to eq 1
  end

  it "can produce a clone of itself" do
    new_player = subject.clone
    expect(subject).not_to eq(new_player)
  end

  it "can invalidate its hand" do
    hand = subject.hand
    hand.deal(card)

    subject.reset_hand
    expect(subject.hand).not_to eq(hand)
  end

  it "returns bust when bank is zero" do
    expect(bust_player.bank).to eq(0)
    expect(bust_player.bust?).to eq(true)
  end

  it "has an ai class" do
    expect(subject.ai_class).to eq(ScriptWarsBlackjack::Players::Sample)
  end

  it "can make a bet" do
    expect(subject.make_bet).to eq(1000)
  end

  it "can loose a bet" do
    subject.make_bet
    subject.forfit_bet

    expect(subject.bank).to eq(0)
  end

  it "can take a turn" do
    expect(subject.take_turn).to eq(:stand)
  end

end
