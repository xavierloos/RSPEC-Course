require "card"
RSpec.describe Card do
  let(:card) { Card.new("Ace", "Spades") }

  it "has a rank and can change" do
    expect(card.rank).to eq "Ace"
    card.rank = "Queen"
    expect(card.rank).to eq "Queen"
  end

  it "has a suit" do
    expect(card.suit).to eq "Spades"
  end
  it "has a custom error message" do
    card.suit = "Spades"
    comparison = "Spades"
    expect(card.suit).to eq(comparison), "Hey, I expected #{comparison} but instead I got #{card.suit}"
  end
end
