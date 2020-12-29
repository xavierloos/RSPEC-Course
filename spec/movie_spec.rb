class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3) # this slow down out test so in this point this is a good example for mocking
    true
  end

  def act
    "I love you, baby"
  end

  def fall_off_ladder
    "Call my agent! No way"
  end

  def light_on_fire
    false
  end
end

class Movie
  attr_reader :actor

  def initialize(actor)
    @actor = actor
  end

  def start_shooting
    if actor.ready?
      p actor.act
      p actor.fall_off_ladder
      p actor.light_on_fire
      # let's say we call again act, so now the act method is receiving twice
      # this will pass in rspec as we are using a double to test, but we are not covering all the test because we have only one act method to test
      p actor.light_on_fire
      #   p actor.act
    end
  end
end

# The movie class doesn't really care about how the Actor is going to do that
# The only real thing Movie cares about is that these method are available to an Actor so they can communicate them to the actor object and tell it what to perform
# actor = Actor.new("Brad Pitt")
# movie = Movie.new(actor)
# movie.start_shooting

RSpec.describe Movie do
  # We want to use a mock to test
  # We call the same objects as the real Actor class
  let(:stuntman) { double("Mr. Danger", ready?: true, act: "Quote", fall_off_ladder: true, light_on_fire: true) }
  # this expects an Actor object but we will use our stuntman becaus probably we haven't built the Actor class yet and stuntman responds to the 4 methods called in start_shooting
  subject { described_class.new(stuntman) }

  describe "#start_shooting method" do
    it " expects the actor to do 3 actions" do
      # we write our expetations before we invoke start_shooting method, this is called a behavior driven style
      #   expect(stuntman).to receive(:ready?)
      #   expect(stuntman).to receive(:act)
      #   expect(stuntman).to receive(:fall_off_ladder)
      #   expect(stuntman).to receive(:light_on_fire)

      # we can attach a method called ONCE, if it is receive more than once this will fail
      expect(stuntman).to receive(:ready?).once
      # EXACTLY: check that receive exaclty a givem number of times
      expect(stuntman).to receive(:act).exactly(1).times
      # AT_MOST: means that I expect to be invoke at most 1 time, if you put at_most 5 times you will have a range to be invoke from 1 to 5, if it is more than 5 this will fail
      expect(stuntman).to receive(:fall_off_ladder).at_most(1).times
      # TWICE: to be call 2 times
      expect(stuntman).to receive(:light_on_fire).twice
      # AT_LEAST: puts a boundary wehre a method must be invoked at leas this number of times
      # expect(stuntman).to receive(:light_on_fire).at_least(2).times
      subject.start_shooting
    end
  end
end
