# defmodule Accumulate do
#   def accumulate(list, fun) do
#     for el <- list, do: fun.(el)
#   end
# end

# It isn't allowed to use map, etc. So, it's necessary to use a recursive version

defmodule Accumulate do
  def accumulate([], _), do: []

  def accumulate([head | tail], fun) do
    [fun.(head)] ++ accumulate(tail, fun)
  end
end
