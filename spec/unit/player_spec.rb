RSpec.describe ScriptWarsBlackjack::Player do
  subject { described_class.new 'Chris', 1000 }

  it "has a name, bank and hand" do
    expect(subject.name).to eq('Chris')
    expect(subject.bank).to eq 1000
    expect(subject.hand).to be_a ScriptWarsBlackjack::Hand
  end

  it "delegates to hand to add cards" do
    card = ScriptWarsBlackjack::Card.new(:king)
    subject.deal(card)
    expect(subject.hand.cards.count).to eq 1
  end

  it "can produce a clone of itself" do
    new_player = subject.clone
    expect(subject).not_to eq(new_player)
  end
end
