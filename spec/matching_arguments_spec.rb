# we cam customize the return value of a subbed method depending on the argument(s) with which that method is invoke
# if we use FIRST method from ruby which returns the first value in an array (per example), and we can also pass it an argument of how many items in the array want to be returned
RSpec.describe "matching arguments" do
  it "can return different values depending on the argument" do
    three_element_array = double # [10,3,8]
    # with no arguments (no_args)
    # we get the first element outside of an array
    allow(three_element_array).to receive(:first).with(no_args).and_return(10)
    # with arguments
    # we get an array with values asked
    allow(three_element_array).to receive(:first).with(1).and_return([10])
    allow(three_element_array).to receive(:first).with(2).and_return([10, 3])
    # if we want the argument be more than a specific value
    allow(three_element_array).to receive(:first).with(be >= 3).and_return([10, 3, 8])

    expect(three_element_array.first).to eq 10
    expect(three_element_array.first(1)).to eq [10]
    expect(three_element_array.first(2)).to eq [10, 3]
    expect(three_element_array.first(100)).to eq [10, 3, 8]
  end
end

# Resources: https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/setting-constraints/matching-arguments
