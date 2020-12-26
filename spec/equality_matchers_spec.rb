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
  describe "equal and be matcher" do
    let(:c) { [1, 2, 3] }
    let(:d) { [1, 2, 3] }
    let(:e) { c }

    it "cares about object identity" do
      # 'eq' checks just the values we have
      expect(c).to eq(d)
      # 'eql' checks values and type
      expect(c).to eql(d)
      # 'equal' checks for identity
      expect(c).to equal(e)
      # 'equal' is the same thing as 'be'
      expect(c).to be(e)

      expect(c).not_to equal(d)
      expect(c).not_to equal([1, 2, 3])
    end
  end
end
