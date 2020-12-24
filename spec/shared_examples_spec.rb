RSpec.shared_examples "a Ruby object with a length method eq 3" do
  it "returns the number of items" do
    p "Hello from shared_examples"
    expect(subject.length).to eq 3
  end
end

# We could have every describe block in different files with shared example
RSpec.describe Array do
  subject { [1, 2, 3] }
  #   We are repeating this 3 lines en every describe block, DRY the code
  #   it "returns the number of items" do
  #     expect(subject.length).to eq 3
  #   end
  include_examples "a Ruby object with a length method eq 3" # You call it by the name given
end
RSpec.describe String do
  subject { "abc" }
  #   it "returns the number of items" do
  #     expect(subject.length).to eq 3
  #   end
  include_examples "a Ruby object with a length method eq 3"
end
RSpec.describe Hash do
  subject { { a: 1, b: 2, c: 3 } }
  #   it "returns the number of items" do
  #     expect(subject.length).to eq 3
  #   end
  include_examples "a Ruby object with a length method eq 3"
end

class SausageLink
  def length
    3
  end
end

RSpec.describe SausageLink do
  subject { described_class.new }
  #   it "returns the number of items" do
  #     expect(subject.length).to eq 3
  #   end
  include_examples "a Ruby object with a length method eq 3"
end
