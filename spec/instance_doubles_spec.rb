# "instance_double" is a method where you pass the class of the intance you want to make the double up, this will verify that the API or the interface you give to your double matches the interface that's actually defines on your real life class
# it can also verify that your spec are always uo to date with the actual class that you are testing
class Person
  def a(seconds)
    sleep(seconds)
    "hello"
  end
end

RSpec.describe Person do
  describe "regular double" do
    it " can implement any method" do
      # we don't verify
      person = double(a: "Hello", b: 20) # this won't fail as we are not verifying thaty we have in real life the method 'b'
      expect(person.a).to eq "Hello"
    end
  end

  describe "instance double" do
    it "can only implement methods that are defined in the class" do
      # we verify
      # person = instance_double(Person, a: 'Hello', b: 20) <- This will fail as in real life of the class we don't have the method 'b'
      person = instance_double(Person) # We pass the class name that we want to "verify"
      # allow(person).to receive(:a).with(3, 4).and_return("New Hello") <- this will fail as in real life of the class, we are only passing one argument
      allow(person).to receive(:a).with(3).and_return("New Hello")
      # allow(person).to receive(:b).with(3).and_return("New Hello") <- FAIL: 'b' is not defined in real life
      expect(person.a(3)).to eq "New Hello"
      # THIS IS STILL A MOCK, but they are very close to real life that you can tell the differences
    end
  end
end

# Resources:
# https://semaphoreci.com/community/tutorials/introduction-to-verifying-doubles-in-rspec
# https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/verifying-doubles/using-an-instance-double
# https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/verifying-doubles
