RSpec.describe Hash do
  it "should start off empty" do
    p subject
    p subject.class
    expect(subject.length).to eq 0
    subject[:some_key] = "Some value"
    expect(subject.length).to eq 1
  end
  # It createas a new hash subject
  it "should start off empty" do
    expect(subject.length).to eq 0
  end
end
