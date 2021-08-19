defmodule WordCount do

  defp one_more(existing_value) do
    existing_value + 1
  end

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[^[:alnum:]-]/ui, trim: true)
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &one_more/1)
    end)
  end
end
