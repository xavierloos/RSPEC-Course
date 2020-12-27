# A predicate method is just a method that returns a boolean value either TRUE or FALSE
# Predicate methods in Ruby are very easily identifiable because they all end with a question mark '?' (not a thechnical requirement but it is a kind of a popular community standard)

p 0.zero? # true
p 15.zero? # false
p 2.even? # true
p 3.even? # false
p 11.odd? # true
p 16.odd? # false
p [].empty? # true
p [1].empty? # false

RSpec.describe "predicate methods and predicate matchers" do
  it "can be tested with Ruby methods" do
    result = 16 / 2
    expect(result.even?).to eq true  # true
  end

  it "can be tested with predicate matchers" do
    expect(16 / 2).to be_even # same as doing 'even?'
    expect(15).to be_odd # same as doing 'odd?'
    expect(0).to be_zero # same as doing 'zero?'
    expect([]).to be_empty # same as doing 'empty?'
    expect([2]).not_to be_empty # same as doing 'empty?'
  end

  describe 0 do #same as doing 'subject{0}'
    it { is_expected.to be_zero }
  end
end
