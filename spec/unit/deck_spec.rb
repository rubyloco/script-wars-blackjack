require 'spec_helper'

RSpec.describe ScriptWarsBlackjack::Deck do
  subject { described_class.standard }
  it "builds a standard deck of 52" do
    expect(subject.cards.length).to eq(52)
  end
end
