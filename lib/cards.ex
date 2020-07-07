defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Use in place of nested iteration. Flatmaps the two arrays
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def deal(deck, hand_size) do
    # Splits deck into as many elements as the hand_size
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
    # Invokes erlang language
    binary = :erlang.term_to_binary(deck)
    # Write deck to filesystem
    File.write(filename, binary)
  end

  def load(filename) do
    { status, binary } = Files.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "File does not exist"
    end
  end

end
