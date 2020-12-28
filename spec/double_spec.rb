# Mocking, mock means emulate something or replace a real thing with a simulated version of it.
# If we hame multiple objects sometimes is hard to test any of these objects in isolation because they're all so tightly connected to the other parts of the system
# unit test = targetting just one specific unit of the program
# Whenever we're testing the whole program, we take one object to test and we emulate the behaviour of the rest objects
# This allows to create a wall of separation between these coupled objects and actually test each one in separate isolation
# DOUBLE: creates a testable object that can respond to any variety of methods (stuntman, are NOT real life objects)
RSpec.describe "a random double" do
  it "only allows defines methods to be invoked" do
    # we have to define or allow the methods that are going to be available to be invoked on this object
    # we pass the methods as a symbol
    stuntman = double("Mr. Dnager", fall_of_ladder: "Ouch", light_on_fire: true)
    expect(stuntman.fall_of_ladder).to eq "Ouch"
    expect(stuntman.light_on_fire).to eq true
    #other syntax
    # we use a new method ALLOW
    # it will take a single argument that you want to have a kind of message to send
    # if you dont return a message in the allow method it will assume by default as NIL
    # allow(stuntman).to receive(:fall_of_ladder) <- NIL value by default
    stuntman = double("Mr. Dnager")
    allow(stuntman).to receive(:fall_of_ladder).and_return("Ouch")
    expect(stuntman.fall_of_ladder).to eq "Ouch"
    # receive_messages
    # allows to give a hash if we want to define more that one method
    stuntman = double("Mr. Dnager")
    allow(stuntman).to receive_messages(fall_of_ladder: "Ouch", light_on_fire: true)
    expect(stuntman.fall_of_ladder).to eq "Ouch"
    expect(stuntman.light_on_fire).to eq true
  end
end
RSpec.describe "doubles" do
  it "tests the student's knowledge of the course's content" do
    dbc = double("Database Connection", connect: true, disconnect: "Goodbye")
    expect(dbc.connect).to eq true
    expect(dbc.disconnect).to eq "Goodbye"
  end
end
RSpec.describe "doubles" do
  it "tests the student's knowledge of the course's content" do
    fs = double("File System")
    allow(fs).to receive(:read).and_return("Romeo and Juliet")
    allow(fs).to receive(:write).and_return(false)
  end
end
