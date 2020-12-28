# AND / OR
# compound expectation allows us to combine more than one match on a single line
RSpec.describe 25 do
  it "can test for multiple matcher" do
    # the next example has to return BOTH true in order for the spec to pass
    # expect(subject).to be_odd
    # expect(subject).to be > 20

    # we simplify in one line using AND
    expect(subject).to be_odd.and be > 20
  end
  #   one-liner syntax
  it { is_expected.to be_odd and be > 20 }
end

RSpec.describe "caterpillar" do
  it "supports multiple matchers on a single line" do
    expect(subject).to start_with("cat").and end_with("pillar")
  end
  #   one-liner syntax
  it { is_expected.to start_with("cat") and end_with("pillar") }
end

# OR method
RSpec.describe [:usa, :canada, :mexico] do
  # we check randomness
  # one of them will be true
  it "can check for multiple possibilities" do
    expect(subject.sample).to eq(:usa).or eq(:canada).or eq(:mexico)
  end
  #   one-liner syntax
  #   doesn't apply because of the sample method
end
