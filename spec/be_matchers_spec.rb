# In Ruby there are only 2 falsy values that allows you to false in a conditional contet
# falsy values => false, nil
# truthy values => everything else

RSpec.describe "be matchers" do
  it "can test for truthiness" do
    expect(true).to be_truthy
    expect("hello").to be_truthy
    expect(5).to be_truthy
    expect(0).to be_truthy
    expect(-0).to be_truthy
    expect(3.14).to be_truthy
    expect([]).to be_truthy
    expect([1, 2]).to be_truthy
    expect({}).to be_truthy
    expect(:symbol).to be_truthy
  end
  it "can test for falsiness" do
    expect(false).to be_falsy
    expect(nil).to be_falsy
  end
  # nil is a falsy value but it's the specific object in Ruby
  it "can test for nil" do
    expect(nil).to be_nil # nil?
    my_hash = { a: 5 }
    expect(my_hash[:b]).to be_nil
  end
end
