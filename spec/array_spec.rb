RSpec.describe Array do
  it "should return the array lenght" do
    expect(subject.length).to eq 0
    subject.push("Javier")
    expect(subject.length).to eq 1
  end
end
