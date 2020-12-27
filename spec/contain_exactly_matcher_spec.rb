# 'contain_exactly' checks that an array includes certain predefined set of elements.
# It doesn't concern itself with the order of the elements, it just make sure that array has those elements in some order.
RSpec.describe "contain_exactly matcher" do
  subject { [1, 2, 3] }

  describe "long form syntax" do
    it "should check for the presence of all elements" do
      # we don't care about the order
      expect(subject).to contain_exactly(1, 2, 3)
      expect(subject).to contain_exactly(3, 2, 1)
      expect(subject).to contain_exactly(2, 1, 3)
      # expect(subject).to contain_exactly(1, 2) <=this will failed as 3 is missing from the list
    end
  end
  # One-liner syntax
  it { is_expected.to contain_exactly(1, 2, 3) }
  it { is_expected.to contain_exactly(1, 3, 2) }
  it { is_expected.to contain_exactly(3, 2, 1) }
end
