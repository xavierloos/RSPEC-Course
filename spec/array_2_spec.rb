RSpec.describe Array do
  # subject(:sally) { ['Sally', 'Holly'] } => one-liner code
  subject(:sally) do
    ["Sally", "Holly"]
  end

  it "should have a length of 2" do
    expect(subject.length).to eq 2
    sally.pop
    expect(sally.length).to eq 1
  end

  it "should have a length of 2" do
    expect(sally.length).to eq 2
  end
end
