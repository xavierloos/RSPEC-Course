RSpec.describe Hash do
  #  this do the same as LET statement, but with the let you will write less code
  # let(:bob){{a:1,b:2}}
  # 'Custom subject'
  subject(:bob) do
    { a: 1, b: 2 }
  end

  it "has two key-value pairs" do
    # You can use subject or the name, both are equals
    expect(subject.length).to eq 2
    expect(bob.length).to eq 2
  end

  describe "nested example" do
    it "has two key-value pairs" do
      # You can use it in a nested example
      expect(subject.length).to eq 2
      expect(bob.length).to eq 2
    end
  end
end
