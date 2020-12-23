RSpec.describe "Some magic" do
  before(:context) do
    p "Before context"
  end
  before(:example) do
    p "Before example"
  end
  it "does math" do
    p expect(1 + 2).to eq 3
  end
  context "with condition A" do
    before(:context) do
      p "Inner Before context"
    end
    before(:example) do
      p "Inner Before example"
    end
    it "does sum" do
      p expect(1 + 4).to eq 5
    end
    it "does minus" do
      p expect(5 - 4).to eq 1
    end
  end
end

 