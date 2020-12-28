# 'satisfy' matcher allows to create our very own assertions/expectations
# We can use it to check for a custom condition to be met

RSpec.describe "satisfy matcher" do
  subject { "racecar" }
  #   subject { "racecars" } <- this will evalute to false and will fail

  it "is a palindrome" do
    expect(subject).to satisfy { |value| value == value.reverse } # this won't give a specific message of what's going on
  end

  it "can accept a custom error message" do
    expect(subject).to satisfy("be a palindrome") do |value|
      value == value.reverse
    end
    # expected "racecars" to be a palindrome <- this message will be raise in case of a failure which is more human language
  end
end
