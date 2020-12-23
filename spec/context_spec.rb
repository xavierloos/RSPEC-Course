RSpec.describe "#even? method" do
  # it "should return true if the number is even"
  # it "should return true if the number is odd"
  describe "wiht even number" do
    it "should return true" do
      expect(4.even?).to eq true
    end
  end
  # Context and describe block do the same, context is easier to read and elegant.
  context "wiht odd number" do
    it "should return false" do
      expect(5.even?).to eq false
    end
  end
end
