RSpec.describe "equality matcher" do
  let(:a) { 3.0 }
  let(:b) { 3 }

  describe "eq matcher" do
    it "test for value and ignores the type" do
      expect(a).to eq(3)
      expect(b).to eq(3.0)
      expect(a).to eq(b)
    end
  end

  describe "eql matcher" do
    it "test for value, including same type" do
      expect(a).not_to eql(3)
      expect(b).not_to eql(3.0)
      expect(a).not_to eql(b)

      expect(a).to eql(3.0)
      expect(b).to eql(3)
    end
  end
end
