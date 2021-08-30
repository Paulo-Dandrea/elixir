defmodule ProteinTranslation do
  import Enum
  # @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    codons = for <<x::binary-3 <- rna>>, do: x

    names_for_codons =
      codons
      |> map(&(codon_dict(&1)))
      |> reduce_while([], fn (c, acc) ->
        # Lembrar que o acc tem que sempre vir depois, já que vem como Tail
        if c !== "STOP", do: {:cont, [c | acc] } , else: {:halt, acc}
      end)
      |> reverse()

    if Enum.member?(names_for_codons, :error) do
      {:error, "invalid RNA"}
    else
      {:ok, names_for_codons}
    end
  end

  def codon_dict(codon) do
    case codon do
      "UGU" -> "Cysteine"
      "UGC" -> "Cysteine"
      "UUA" -> "Leucine"
      "UUG" -> "Leucine"
      "AUG" -> "Methionine"
      "UUU" -> "Phenylalanine"
      "UUC" -> "Phenylalanine"
      "UCU" -> "Serine"
      "UCC" -> "Serine"
      "UCA" -> "Serine"
      "UCG" -> "Serine"
      "UGG" -> "Tryptophan"
      "UAU" -> "Tyrosine"
      "UAC" -> "Tyrosine"
      "UAA" -> "STOP"
      "UAG" -> "STOP"
      "UGA" -> "STOP"
      _ -> :error
    end
  end

  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case codon_dict(codon) do
      :error -> {:error, "invalid codon"}
      _ -> {:ok, codon_dict(codon)}
    end
  end
end



# BETTER PRACTICES:

# How I could use a map dictionary:
defp proteine_map() do
  %{
    UGU: "Cysteine",
    UGC: "Cysteine",
    UUA: "Leucine",
    etc..
  }
end

proteine = proteine_map() |> Map.fetch(String.to_atom(codon))

case proteine do
  {:ok, trans} -> {:ok, trans}
  _ -> {:error, "invalid codon"}
end


# Great inspiration

defmodule ProteinTranslation do
  @codonToPolypeptide %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }


  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> String.graphemes()
    |> Enum.chunk_every(3)
    |> Enum.map(&Enum.join/1)
    |> process_codons([])
    |> IO.inspect()
  end

  defp process_codons([], acc) do
    {:ok, :lists.reverse(acc)}
  end

  defp process_codons([h | t], acc) do
    case of_codon(h) do
      {:ok, "STOP"} -> process_codons([], acc)
      {:ok, protein} -> process_codons(t, [protein | acc])
      _ -> {:error, "invalid RNA"}
    end
  end


  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case @codonToPolypeptide[codon] do
      nil -> {:error, "invalid codon"}
      protein -> {:ok, protein}
    end
  end
end
