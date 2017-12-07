require 'game'

describe Game do
  let(:victim){double(:victim, health: 100)}
  let(:belligerent){double(:belligerent, attack: 10)}
  let(:player) {double(:player)}
  let(:player_class) {double(:Player, new: player)} 

  subject {described_class.new("player1", "player2", player_class)}

  describe "#attack" do
    it "One player attacks another" do
      expect(victim).to receive(:hurt).with(10)
      subject.attack(belligerent, victim)
    end
  end
  describe "#player1" do
  	it "returns player1 object" do
  		expect(subject.player1).to eq player
  	end
  end
  describe "#player2" do
  	it "returns player2 object" do
  		expect(subject.player2).to eq player
  	end
  end
end
