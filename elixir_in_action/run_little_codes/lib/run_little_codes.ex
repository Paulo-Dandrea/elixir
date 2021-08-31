# recursive
defmodule ListLength do
  def calc(list) do
    do_calc(0, list)
  end

  defp do_calc(len, []) do
    len
  end

  defp do_calc(len, [_head | tail]) do
    do_calc(len + 1, tail)
  end
end

# A range/2 function that takes two integers, from and to, and returns a
# list of all numbers in the given range

# recursive
defmodule Range do
  def calc(from, to) do
    do_calc(from, to, [])
  end

  defp do_calc(from, to, list) do
    case from <= to do
      true -> do_calc(from, to - 1, [to | list])
      false -> list
    end
  end
end

# A positive/1 function that takes a list and returns another list that contains
# only the positive numbers from the input list

# recursive
defmodule Positive do
  def calc(list) do
    do_calc(list, [])
  end

  defp do_calc([], positives) do
    positives
  end

  defp do_calc([head | tail], positives) do
    case head > 0 do
      true -> do_calc(tail,  positives ++ [head])
      false -> do_calc(tail, positives)
    end
  end
end
