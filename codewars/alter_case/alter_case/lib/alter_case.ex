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
