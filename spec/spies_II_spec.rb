# The 'allow' syntax allows to spy in a specific method
class Car
  def initialize(model)
    @model = model
  end
end

class Garage
  attr_reader :storage

  def initialize
    @storage = []
  end

  def add_2_collection(model)
    @storage << Car.new(model)
  end
end

RSpec.describe Garage do
  # We need to fake two things, Car class and car instance
  # we use let to define a variable which will be a 'instance_double' of the Car class
  let(:car) { instance_double(Car) } # this by itself it is just creating a random double
  # we need to make a connection in a before loop
  before do
    # whenever we use the 'allow' syntax, this enables SPY funtionality
    allow(Car).to receive(:new).and_return(car)
  end

  it "adds a car to its storage" do
    subject.add_2_collection("Honda")
    # because we are using "allow" syntax, we can use the have_received method.
    # This depends in which way you want to do your test:
    # -> assertions first and then take actions or
    # -> take action first and then certain things have happened
    expect(Car).to have_received(:new)
    expect(Car).to have_received(:new).with("Honda")
    expect(subject.storage.length).to eq 1
    expect(subject.storage.first).to eq car
  end
end

# Resource: https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/basics/spies
