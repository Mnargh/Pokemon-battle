require 'player'

describe Player do
  subject {described_class.new("Nedbles")}

  describe "#name" do
  	it "returns the name" do
  	  expect(subject.name).to eq "Nedbles"
  	end
  end
end