require "card"
RSpec.describe "Card" do
  it "has a type" do
    card = Card.new("Ace of spades")
    expect(card.type).to eq "Ace of spades"
  end
end
