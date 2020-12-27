RSpec.describe "comparison matchers" do
  it "allows for comparison with built-in Ruby operators" do
    expect(10).to be > 5
    expect(8).to be < 15

    expect(1).to be >= -1
    expect(1).to be >= 1

    expect(22).to be <= 100
    expect(22).to be <= 22
  end
  # is_expected one-liner syntax
  describe 100 do # this is the same as doing 'subject {100}'
    # 'be' is what you typically use whenever you're using a comparison matcher, that ut reads almost exactly like English
    it { is_expected.to be > 90 }
    it { is_expected.to be >= 100 }
    it { is_expected.to be < 500 }
    it { is_expected.to be <= 100 }
    it { is_expected.not_to be > 105 }
  end
end
