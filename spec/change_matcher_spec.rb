# The change matcher checks that something changes as the result of a method invocation
# This will allows to track changes over time modifications to state over ther course of an operation
RSpec.describe "change matcher" do
  subject { [1, 2, 3] }

  it "checks that a method changes object state" do
    # this is ok to do but it someone changes the subject list, this will break
    # expect { subject.push(4) }.to change { subject.length }.from(3).to(4)

    # instead of using the 'FROM TO' syntax we can use the method called 'by' and provide and argument, now is dynamic, in case the list in subject changes this won't break
    expect { subject.push(4) }.to change { subject.length }.by(1)
  end

  it "accepts negative arguments" do
    # expect { subject.push(4) }.to change { subject.length }.from(4).to(3)
    expect { subject.pop }.to change { subject.length }.by(-1)
  end
end
