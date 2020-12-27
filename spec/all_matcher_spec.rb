#  The  'all' matcher allow us to check for a particular condition or assertion within a given collections like an array

RSpec.describe "all matcher" do
  it "allows for a aggreagte checks" do
    # I want to check if all values are odd
    # this could be written like this but it is a long syntax to write

    # [5,7,9].each do |val|
    #     expect(val).to be_odd
    # end

    # RSpec has a helper method called 'all' to help us facilitate this exact logic in just a single line of syntax
    expect([5, 7, 9, 13]).to all(be_odd)
    expect([4, 6, 8, 10]).to all(be_even)
    expect([[], [], []]).to all(be_empty)
    expect([0, 0]).to all(be_zero)
    expect([5, 7, 9]).to all(be < 10)
  end

  describe [5, 7, 9] do
    it { is_expected.to all(be_odd) }
    it { is_expected.to all(be < 10) }
  end
end
