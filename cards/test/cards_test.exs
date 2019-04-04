defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck makes 20 cards" do
    deck_length = length(Cards.createDeck)
    assert deck_length == 20
  end

  test "shuffling a deck randomize it" do
    deck = Cards.createDeck
    refute deck == Cards.shuffle(deck)
  end
end
