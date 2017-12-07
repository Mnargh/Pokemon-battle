require 'game'

describe Game do
let(:victim){double(:victim, health: 100)}
let(:belligerent){double(:belligerent, attack: 10)}
  
  describe "#attack" do
    it "One player attacks another" do
      expect(victim).to receive(:hurt).with(10)
      subject.attack(belligerent, victim)
    end
  end
end
