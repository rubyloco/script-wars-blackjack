require 'spec_helper'

RSpec.describe ScriptWarsBlackjack::Card do
  it "face cards have a value of 10" do
    card = described_class.new :king
    expect(card.values).to eq([10])
  end
end
