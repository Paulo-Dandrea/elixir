defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  # @spec numeral(pos_integer) :: String.t()
  # def numeral(number, roman \\ "") do
  #   # if number >= 1000 do
  #   #   # Io.put(number)
  #   #   roman = roman <> "M"
  #   #   numeral(number - 1000, roman <> "M")
  #   # end
  #   case number do
  #     >= 1000 -> numeral(0, "I")
  #     < 0 -> roman
  #   end
  # end

  def numeral(number, roman \\ "") when number >= 1000, do: numeral(number, roman <> "M")
  def numeral(number, roman \\ "") when number <= 0, do: roman


  # def numeral(0, roman) do
  #   roman
  # end
end
