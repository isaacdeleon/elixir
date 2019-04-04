defmodule Cards do
  @moduledoc """
    This my first elixir app with func programming.
  """

  @doc """
    return a list of string in form of deck
  """
  def createDeck do
    values = ["Ace","Two","Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    #Wrong Solution
    #for value <- values do
    #  for suit <- suits do
    #    "#{value} of #{suit}"
    #  end
    #end

    #solution option 1
    #cards = for value <- values do
    #  for suit <- suits do
    #    "#{value} of #{suit}"
    #  end
    #end

    #List.flatten(cards)

    #best solution
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines wheather a deck contains a given card.

    ## Examples
    iex> deck = Cards.createDeck
    iex> Cards.contains?(deck, "Ace of Spades")
    true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Dives a deck into a hand and the remiander of the deck.
    The `handSize` argument indicates how many cards cards shoul be in the hand.

    ## examples
      iex> deck = Cards.createDeck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, handSize) do
    Enum.split(deck, handSize)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end

    #{status, binary} = File.read(filename)
    #case status do
    #  :ok -> :erlang.binary_to_term binary
    #  :error -> "That file does not exist"
    #end
  end

  def createHand(handSize) do
    #deck = Cards.createDeck
    #deck = Cards.shuffle(deck)
    #hand = Cards.deal(deck, handSize)
    Cards.createDeck
    |> Cards.shuffle
    |> Cards.deal(handSize)
  end
end
