require 'card'

RSpec.describe Card do
  it "face cards have a value of 10" do
    card = Card.new :king
    expect(card.values).to eq([10])
  end
end
