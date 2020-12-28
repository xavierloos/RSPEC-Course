class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
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
actor = Actor.new("Brad Pitt")
movie = Movie.new(actor)
movie.start_shooting
