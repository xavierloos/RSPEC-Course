# Spies are an alternate type of test doubles and the difference between them is that they follow a slightly different pattern when it comes to testing
# 'double' method places the expectation before the action VS 'spies' places the expectation after the action
# Syntax are very similar
# Spies have a big advantage of track any message that it receives even if we haven't explicitly told it

RSpec.describe "spies" do
  let(:animal) { spy("animal") }
  it "confirms that a  message has been received" do
    # if we have a regular double
    # expec(animal).to receive(:eat_food)
    # animal.eat_food

    # when we use spies, it has to be in reverse
    animal.eat_food
    # we put our expectation afer the method is invoked
    expect(animal).to have_received(:eat_food)
    # expect(animal).to have_received(:eat_human) <- this will fail as we didn't pass it
    expect(animal).not_to have_received(:eat_human) # alternative
  end

  it "reset between examples" do
    expect(animal).not_to have_received(:eat_food)
  end

  it "retains the same funtionality of a regular double" do
    animal.eat_food
    animal.eat_food
    animal.eat_food("sushi")
    expect(animal).to have_received(:eat_food).exactly(3).times
    expect(animal).to have_received(:eat_food).at_least(2).times
    expect(animal).to have_received(:eat_food).with("sushi")
    expect(animal).to have_received(:eat_food).once.with("sushi")
  end
end

# Resources:
# https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/basics/spies
# https://martinfowler.com/articles/mocksArentStubs.html
# https://revs.runtime-revolution.com/are-you-spying-on-me-a-quick-overview-of-spies-in-rspec-c5bc7669b897?gi=83254e2a760
