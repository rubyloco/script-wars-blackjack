require 'spec_helper'

RSpec.describe ScriptWarsBlackjack::Dealer do
  subject { described_class.new }

  it "adds players" do
    subject.add_player 'Chris'
    subject.add_player 'Hunter'

    expect(subject.players.map(&:name)).to eq(['Chris', 'Hunter'])
  end
end
