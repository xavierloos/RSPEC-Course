require "overwriting_let"
RSpec.describe ProgrammingLanguage do
  let(:language) { ProgrammingLanguage.new("Python") }
  it "should store the name of the language" do
    expect(language.name).to eq "Python"
  end
  context "With no argument" do
    let(:language) { ProgrammingLanguage.new }
    it "should default Ruby as the name" do
      expect(language.name).to eq "Ruby"
    end
  end
end
