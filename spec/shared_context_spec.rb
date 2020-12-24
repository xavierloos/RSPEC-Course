# Shared examples allows to extract the common examples to a shared example group and
# shared context allows to extraxt the common business logic and the setup code to  a similar outside block that is usually declared in an external file and that is the imported.
# this can be injected in diferent files so you don't repeat your code
RSpec.shared_context "common" do
  before do
    @foods = []
  end

  def some_helper_method
    5
  end

  let(:some_variable) { [1, 2, 3] }
end

# this is in another file
RSpec.describe "first example group" do
  include_context "common" # call it by the name

  it "can use outside instance var" do
    expect(@foods.length).to eq 0
    @foods << "Sushi"
    expect(@foods.length).to eq 1
  end

  it "can reuse instance var across differents examples" do
    expect(@foods.length).to eq 0
  end

  it "can use share helper methods" do
    expect(some_helper_method).to eq 5
  end
end

# this is another file
RSpec.describe "second example group" do
  include_context "common" # call it by the name

  it "can use share let var" do
    expect(some_variable).to eq [1, 2, 3]
  end
end
