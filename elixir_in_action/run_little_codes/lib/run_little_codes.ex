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
