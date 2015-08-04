require 'dealer'

RSpec.describe Dealer do
  it "adds players" do
    dealer = Dealer.new
    dealer.add_player 'Chris'
    dealer.add_player 'Hunter'

    expect(dealer.players).to eq(['Chris', 'Hunter'])
  end
end
