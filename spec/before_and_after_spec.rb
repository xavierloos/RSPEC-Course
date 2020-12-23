RSpec.describe "before and after hooks" do
  # :context runs before and after all the examples
  before(:context) do
    p "Hello BEFORE context"
  end
  after(:context) do
    p "Hello AFTER context"
  end
  # :example runs before and after each example
  before(:example) do
    p "Hello BEFORE"
  end
  after(:example) do
    p "Hello AFTER"
  end
  it "is just a random example" do
    p expect(5 * 4).to eq 20
  end
  it "is just another random example" do
    p expect(5 - 4).to eq 1
  end
end
