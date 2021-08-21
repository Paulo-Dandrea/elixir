defmodule Codewars.StringUtils do
  def upcase?(letter) do
    letter == String.upcase(letter)
  end

  def swapcase(letter) do
    case upcase?(letter) do
      false -> String.upcase(letter)
      true -> String.downcase(letter)
    end
  end

  def alter_case(str) do
    str
    |> String.split("")
    |> Enum.map(&swapcase/1)
    |> Enum.join("")
  end
end

 # Another good solutions to learn
  # def rotate(text, shift) do


defmodule Codewars.StringUtils do
  @d ?a - ?A

  def alter_case(str) do
    str
    |> String.to_char_list
    |> Enum.map(&( _alter(&1)) )
    |> List.to_string
  end

  defp _alter(c) when c in ?a..?z, do: c - @d
  defp _alter(c) when c in ?A..?Z, do: c + @d
  defp _alter(c), do: c
end


defmodule Codewars.StringUtils do
  def alter_case(str) do
    import String
    import Enum

    str
    |> codepoints
    |> map(&(if &1 == upcase(&1), do: downcase(&1), else: upcase(&1)))
    |> to_string
  end
end
