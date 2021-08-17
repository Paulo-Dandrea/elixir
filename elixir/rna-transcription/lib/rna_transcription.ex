defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna(String.t()) :: String.t()
  def to_rna_char(char) do
    case char do
      "G" -> "C"
      "C" -> "G"
      "T" -> "A"
      "A" -> "U"
      _ -> char
    end
  end

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    to_string(dna)
    |> String.graphemes()
    |> Enum.map(&RnaTranscription.to_rna_char/1)
    |> Enum.join()
    |> String.to_charlist()
  end
end
