defmodule RotationalCipher do
  defp add(ch, shift) when ch in ?a..?z do
    rem(ch - ?a + shift, 26) + ?a
  end

  defp add(ch, shift) when ch in ?A..?Z do
    rem(ch - ?A + shift, 26) + ?A
  end

  defp add(ch, _), do: ch

  def rotate(text, shift) do
    text
    |> String.to_char_list()
    |> Enum.map(&add(&1, shift))
    |> to_string
  end
end
