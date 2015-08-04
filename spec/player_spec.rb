require 'player'

RSpec.describe Player do
  it "has a name and bank" do
    player = Player.new 'Chris', 1000

    expect(player.name).to eq('Chris')
    expect(player.bank).to eq 1000
  end
end
