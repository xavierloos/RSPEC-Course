# the 'have_attributes' matcher allows to check whether an object has a given set of attributes along with their values
# Thhis  is refering to the puiblic interface or the public API of an object that's going to check whether their attributes are available on the object and wheter those values of those attributes evaluate to what you expect

class ProfessionalWrestler
  # we make it accesible via reader methods
  attr_reader :name, :finishing_move

  def initialize(name, finishing_move)
    @name = name
    @finishing_move = finishing_move
  end
end

RSpec.describe "have_attributes matcher" do
  describe ProfessionalWrestler.new("Stone Cold Steve Austin", "Stunner") do
    it "checks for object attributes and proper values" do
      # you don't havee to check for all of them
      expect(subject).to have_attributes(name: "Stone Cold Steve Austin")
      # if you want to check for more than one attributes you can separate by commas (,)
      expect(subject).to have_attributes(name: "Stone Cold Steve Austin", finishing_move: "Stunner")
    end

    # Your attibutes must be public to be tested

    # one-liner syntax
    it { is_expected.to have_attributes(name: "Stone Cold Steve Austin") }
    it { is_expected.to have_attributes(name: "Stone Cold Steve Austin", finishing_move: "Stunner") }
  end
end
