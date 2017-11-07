defmodule Cards do
  @moduledoc """
    Documentation for Cards.
  """

  @doc """
   Crate deck.

  ## Examples

      iex> {hand, _rest} = Cards.create_deck |> Cards.deal(1)
      iex> hand
      ["Ace of Spades"]

  """
  def create_deck do
    values = ["Ace","Two","Three","Four","Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end
  end

  @doc """
  shuffle deck pass by parameter
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Contains or not a deck

  ## EXAMPLES  

    iex> Cards.create_deck |> Cards.contains?("Ace of Spades") 
    true
  """
  def contains?(deck,card) do
    Enum.member?(deck,card)
  end  

  @doc """
  Deal hand size
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save deck
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end  

  @doc """
  Load deck
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, reason} -> "Error: #{reason}"
    end
  end  
  
  @doc """
  Create hand
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
