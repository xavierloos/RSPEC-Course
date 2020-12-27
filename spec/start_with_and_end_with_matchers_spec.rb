# 'start_with/end_with' checks that a given object either begins or end with one or more values
# this care about case-sensitivity
RSpec.describe "start_with_and_end_with" do
  describe "caterpillar" do
    it "should check for substring at the beggining or end" do
      expect(subject).to start_with("cat")
      expect(subject).to end_with("pillar")
      # expect(subject).to start_with("Cat") <- this will fail
    end
    # one-liner syntax
    it { is_expected.to start_with("cat") }
    it { is_expected.to end_with("pillar") }
  end

  describe [:a, :b, :c] do
    it "should check for elements in array" do
      expect(subject).to start_with(:a)
      expect(subject).to end_with(:c)
    end
    # one-liner syntax
    it { is_expected.to start_with(:a) }
    it { is_expected.to end_with(:c) }
  end
end
