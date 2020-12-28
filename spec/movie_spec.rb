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
      expect(stuntman).to receive(:ready?)
      expect(stuntman).to receive(:act)
      expect(stuntman).to receive(:fall_off_ladder)
      expect(stuntman).to receive(:light_on_fire)
      subject.start_shooting
    end
  end
end
