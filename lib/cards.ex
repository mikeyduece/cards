defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Use in place of nested iteration. Flatmaps the two arrays
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def deal(deck, hand_size) do
    # Splits array into as many elements as the hand_size
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    # Similar to Ruby' #include?
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    # Invokes erlang library
    binary = :erlang.term_to_binary(deck)
    # Write deck to filesystem
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } -> "File does not exist"
    end
  end

  def create_hand(hand_size) do
#    Pipe operator automagically passes return from function to next as first argument

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
