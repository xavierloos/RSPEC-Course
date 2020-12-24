require "king"
RSpec.describe King do
  # Use described_class for major adaptable code
  # if the class name change in the future you don't need to change all the lines where yuu have called it, only once in the describe block
  subject { described_class.new("Javi") }
  let(:boris) { described_class.new("Boris") }
  it "respresent a King" do
    expect(subject.name).to eq "Javi"
    expect(boris.name).to eq "Boris"
  end
end
