require 'spec_helper'

RSpec.describe ScriptWarsBlackjack::PlayerLoader do
  let(:players_path) { './players' }
  subject { described_class.new(players_path) }

  it 'loads the player files' do
    expect(subject.load).to include('./players/sample.rb')
    expect(subject.player_classes).to include(ScriptWarsBlackjack::Players::Sample)
    expect(subject.names).to include(:Sample)
  end
end
