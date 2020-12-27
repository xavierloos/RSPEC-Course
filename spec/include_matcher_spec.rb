# The 'include' allows us to check whether an object includes something else
# the checking order doesn't matter
RSpec.describe "include matcher" do
  describe "hot chocolate" do
    it "checks for substring inclusion" do
      expect(subject).to include("hot")
      expect(subject).to include("choc")
      expect(subject).to include("late")
    end
    # one-liner syntax
    it { is_expected.to include("choc") }
  end
  describe [10, 20, 30] do
    it "checks for inclusion in teh array, regarles of the order" do
      expect(subject).to include(10)
      expect(subject).to include(10, 20)
      expect(subject).to include(30, 20)
    end
    # one-liner syntax
    it { is_expected.to include(30, 10, 20) }
  end
  describe ({ a: 2, b: 4 }) do
    it "can check for the key existence" do
      expect(subject).to include(:a)
      expect(subject).to include(:a, :b)
      expect(subject).to include(:b, :a)
    end
    it "can check for key-value pair" do
      expect(subject).to include(a: 2)
    end
    # one-liner syntax
    it { is_expected.to include(:b) }
    it { is_expected.to include(:a) }
  end
end
