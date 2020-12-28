# 'respond_to' matcher allows us to verify that an object can respond to a given method
#  We don't care about what the return value of that method is, we don't care about what it does
# We just care that the object has an interface that has that method, that it can receive that message
class HotChocolate
  def drink
    "Delicious"
  end

  def discard
    "PLOP!"
  end

  def purchase(number)
    "Awesome, I just purchase #{number} more hot chocolate beverages"
  end
end

RSpec.describe HotChocolate do
  it "confirms that an object can respond ro a method" do
    expect(subject).to respond_to(:drink)
    expect(subject).to respond_to(:drink, :discard) # checking many methods
  end
  # we check the arguments given
  it "confirms an object can respond to a method with arguments" do
    expect(subject).to respond_to(:purchase)
    expect(subject).to respond_to(:purchase).with(1).arguments
  end
  # one-liner syntax
  it { is_expected.to respond_to(:purchase, :discard) }
  it { is_expected.to respond_to(:purchase).with(1).arguments }
end
