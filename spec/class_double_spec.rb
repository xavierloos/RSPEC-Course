class Deck
  def self.build
    # we have a code here
  end
end

class CardGame
  attr_reader :cards

  def start
    @cards = Deck.build
  end
end

# Whenever we have a system like this where we have a class or an intance method that relies on another class it's definitely a good idea to mock out on other class
# If you are mocking out an intance of another class then you wanto to use an instance_double
# if you are mocking out the class itself then you want to use a class_double

RSpec.describe CardGame do
  it "can only implement class methods that are defines on a clas" do
    # class_double(Deck, build: ["ace", "queen"], shuffle: "Something") <- this will fail as 'shuffled' method in real life does not exist
    # if we haven't build the class Deck yet we can use the class name as a string to pass the spec
    # class_double(Deck, build: ["ace", "queen"]) <- This will fail if we don't have the Deck class
    # class_double('Deck', build: ["ace", "queen"]) <- This will PASS, we pass the class name as a string
    # 'as_stubbed_const' it ensures that whenever a 'Deck' is used is going to replace all calls to the class with this class double
    deck_klass = class_double(Deck, build: ["ace", "queen"]).as_stubbed_const
    expect(deck_klass).to receive(:build)
    subject.start
    expect(subject.cards).to eq ["ace", "queen"]
  end
end

# Resource: https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/verifying-doubles/using-a-class-double
