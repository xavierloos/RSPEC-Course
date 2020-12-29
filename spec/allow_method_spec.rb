# 'allow' method allows us to pair a method with a given return value
# this is not strictly use for mocking, you can 'allow' some method to have fake return values
RSpec.describe "allow methos review" do
  it "can customize retrun value for methods on doubles" do
    calculator = double
    allow(calculator).to receive(:add).and_return(15)
    expect(calculator.add).to eq 15
    expect(calculator.add(3)).to eq 15 # this will pass as it will always return 15
    expect(calculator.add(2, -1)).to eq 15 # this will pass as it is actually not using the numbers passed and it is setting the value 15
    expect(calculator.add("hello")).to eq 15 # it will pass
  end

  it "can stub one or more method on a real object" do
    arr = [1, 2, 3]
    # if we use a real method on the array as SUM this will return 6
    expect(arr.sum).to eq 6
    # we can change that return value for everything we want
    allow(arr).to receive(:sum).and_return(10)
    # expect(arr.sum).to eq 6 <- this will fail as now the return value is not 6, instead is 10
    expect(arr.sum).to eq 10 # <- this will pass even the sum is not right but it is the value we want
    # we are only mocking one method 'SUM', if we use another one it will work as normal
    arr.push(4)
    expect(arr).to eq [1, 2, 3, 4]
  end

  it "can return multiple values in secuence" do
    # we can mimic the last element in the array, POP
    mock_array = double
    allow(mock_array).to receive(:pop).and_return(:c, :b, nil) # the first time is call it will 'pop'  c, then b and then nil, and then nil, and then nil... it will use always return nil if you keep calling it
    expect(mock_array.pop).to eq :c
    # expect(mock_array.pop).to eq :c # this will fail as the second on list is :b
    expect(mock_array.pop).to eq :b
    expect(mock_array.pop).to be_nil
    expect(mock_array.pop).to be_nil
    expect(mock_array.pop).to be_nil
    expect(mock_array.pop).to be_nil
  end
end
