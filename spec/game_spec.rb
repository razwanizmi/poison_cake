require 'game'

describe "Cakes game" do
  it "player stalemates when 5 cakes on the table" do
    expect(game(5)).to be true
  end

  it "player wins when 7 cakes on the table" do
    expect(game(7)).to be true
  end

  it "player wins when 12 cakes on the table" do
    expect(game(12)).to be true
  end

  it "player wins when 23 cakes on the table" do
    expect(game(23)).to be true
  end
end