RSpec.describe ScriptWarsBlackjack::Player do
  subject { described_class.new 'Chris', 1000 }
  
  it "has a name and bank" do
    expect(subject.name).to eq('Chris')
    expect(subject.bank).to eq 1000
  end
end
