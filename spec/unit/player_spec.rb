RSpec.describe ScriptWarsBlackjack::Player do
  subject { described_class.new :Sample, 1000 }
  let(:dealer_hand) { subject.hand }
  let(:game_state) { ScriptWarsBlackjack::GameState.new(subject.clone, dealer_hand.clone) }
  let(:low_bank_player) { described_class.new 'Sample', 50 }
  let(:bust_player) { described_class.new 'Sample', 0 }
  let(:card) { ScriptWarsBlackjack::Card.new(:king) }

  it 'has a name, bank and hand' do
    expect(subject.name).to eq(:Sample)
    expect(subject.bank).to eq 1000
    expect(subject.hand).to be_a ScriptWarsBlackjack::Hand
  end

  it 'delegates to hand to add cards' do
    subject.deal(card)
    expect(subject.hand.cards.count).to eq 1
  end

  it 'can produce a clone of itself' do
    new_player = subject.clone
    expect(subject).not_to eq(new_player)
  end

  it 'can invalidate its hand' do
    hand = subject.hand
    hand.deal(card)

    subject.reset_hand
    expect(subject.hand).not_to eq(hand)
  end

  it 'returns bust when bank is zero' do
    expect(bust_player.bank).to eq(0)
    expect(bust_player.bust?).to eq(true)
  end

  it 'has an ai class' do
    expect(subject.ai_class).to eq(ScriptWarsBlackjack::Players::Sample)
  end

  it 'can make a bet' do
    expect(subject.make_bet(game_state)).to eq(1000)
  end

  it "bets the bank when bank doesn't have enough to fulfil bet" do
    expect(low_bank_player.make_bet(game_state)).to eq(50)
  end

  it 'can loose a bet' do
    subject.make_bet(game_state)
    subject.forfit_bet

    expect(subject.bank).to eq(0)
  end

  it 'can take a turn' do
    expect(subject.take_turn(game_state)).to eq(:hit)
  end

end
