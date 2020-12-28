# 'not_to' method is applicable to basically every matcher
# this check for a negative affirmation

RSpec.describe "not_to method" do
  it "check for the inverse of a matcher" do
    # we are expecting 5 not be equal to 10 which is TRUE
    expect(5).not_to eq 10
    # this is checking that are not equal in terms of object identity
    expect([1, 2, 3]).not_to equal [1, 2, 3]
    # predicate method (?)
    # we check that 10 is not odd
    expect(10).not_to be_odd
    expect([1, 2, 3]).not_to be_empty
    # we check that nil is not true
    expect(nil).not_to be_truthy
    # we can check it does not start or end with
    expect("Philadelphia").not_to start_with("car")
    expect("Philadelphia").not_to end_with("city")
    # we can check it does not respondo to a method
    expect(5).not_to respond_to(:length)
    # we can check that a value is not found
    expect([:a, :b, :c]).not_to include(:d)
    # when we use in a 'positive' way it's better to give an argument error name

    # when you're doing not_to that reverse true, so it's better not to check for any specific error because you're only targetting one specific error and if another one pops up RSpec will consider it as failing or a passing spec

    # expect { 11 / 3 }.not_to raise_error(NameError) <- this will pass
    expect { 11 / 3 }.not_to raise_error
  end
end
