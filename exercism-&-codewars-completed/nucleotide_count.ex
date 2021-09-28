defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.count(strand, fn x -> x == nucleotide end)
  end

  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    Map.new(@nucleotides, fn x -> {x, count(strand, x)} end)
  end
end
