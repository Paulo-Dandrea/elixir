defmodule RnaTranscription do
  @spec to_rna(String.t()) :: String.t()
  def to_rna_char(char) do
    case char do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
    end
  end

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &RnaTranscription.to_rna_char/1)
  end
end
