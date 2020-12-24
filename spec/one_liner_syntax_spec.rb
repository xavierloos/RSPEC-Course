RSpec.describe "shorhand syntax" do
  subject { 5 }

  context "whit clasic syntax" do
    it "should eq 5" do
      expect(subject).to eq 5
    end
  end
  # We invoke the 'it' method
  # you need to provide a block {}
  # this only works for a subject method
  # this won't work with a let method
  context "whit one-liner syntax" do
    it { is_expected.to eq 5 }
  end
end
