require 'player'

describe Player do
  subject {described_class.new("Nedbles")}
  let(:victim) {described_class.new("Trump")}

  describe "#name" do
  	it "Returns the name" do
  	  expect(subject.name).to eq "Nedbles"
  	end
  end
  describe "#health" do
  	it "Returns the health" do
  	  expect(subject.health).to eq 100
  	end
  end
  describe "#hurt" do
  	it "Reduces the health by a value" do
  		expect{subject.hurt(10)}.to change{subject.health}.by(-10)
  	end
  end
  describe "#attack" do

    it "Returns a random attack value with 10hp damage" do
      expect(subject.attack).to eq(10)
    end
    # it "Returns a random attack value minimum 8hp damage" do
    #   srand(1)
    #   expect(subject.attack).to eq(8)
    # end
    # it "Returns a random attack value maximum 12hp damage" do
    #   srand(2)
    #   expect(subject.attack).to eq(12)
    # end

  end


end
