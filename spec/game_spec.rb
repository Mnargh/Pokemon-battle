require 'game'

describe Game do
  let(:victim){double(:victim, name: "Trump", hurt: 10, health: 100)}
  let(:belligerent){double(:belligerent, attack: 10)}
  let(:player) {double(:player, name: "Player name", attack: 10, hurt: 10, health: 100)}
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
  		expect(subject.player(1)).to eq player
  	end
  end
  describe "#player2" do
  	it "returns player2 object" do
  		expect(subject.player(2)).to eq player
  	end
  end
  describe "#fight" do
    it "Player 1 attacks player 2" do
      expect(subject.player(2)).to receive(:hurt).with(10)
      subject.fight(player)
    end

    it "Goes to next player's turn after attacking" do

      subject.fight(player)
      expect(subject.turn).to eq 2
    end
  end
  describe "#strings" do
    it "Displays the name and health of a player" do
      expect(subject.health_string(1)).to eq "Player name HP: 100/100"
    end
    it "Displays message confirming belligerent has attacked victim" do
      subject.fight(victim)
      expect(subject.attack_string).to eq "Player name attacked Trump!"
    end
    it "Displays the title with player 1 vs player 2" do
      expect(subject.title_string).to eq "Player name vs Player name..."
    end
    it "Displays whose turn it is" do
      expect(subject.whose_turn_string).to eq "It's Player name's turn!"
    end
  end
  describe "#loser" do
  	it "returns nil if all players are alive" do
  		expect(subject.loser).to eq nil
  	end
  	it "returns a winner if a player is dead" do
  	  allow(player).to receive(:health).and_return(0)
  	  expect(subject.loser).to eq player
  	end
  end 
end
