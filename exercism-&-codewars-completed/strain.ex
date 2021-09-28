defmodule Strain do
  def keep(list, fun) do
    hd = List.first(list)

    list = it_applies(fun, list, :keeping)

    if is_list(hd) do
      el_length = length(hd)

      Enum.chunk_every(list, el_length)
    else
      list
    end
  end

  def discard(list, fun) do
    hd = List.first(list)
    list = it_applies(fun, list, :discarding)

    if is_list(hd) do
      el_length = length(hd)

      Enum.chunk_every(list, el_length)
    else
      list
    end
  end

  def it_applies(fun, list, action) do
    case action do
      :discarding -> list |> Enum.map(&if apply(fun, [&1]), do: [], else: &1) |> flattens
      :keeping -> list |> Enum.map(&if apply(fun, [&1]), do: &1, else: []) |> flattens
    end
  end

  def flattens(list) do
    case length(list) do
      0 -> []
      _ -> List.flatten(list)
    end
  end
end

# OMG, look this solution from another student
# Generator expression - Comprehension

defmodule Strain do
  def keep(list, fun) do
    for i <- list, fun.(i), do: i
  end

  def discard(list, fun) do
    for i <- list, !fun.(i), do: i
  end
end

# Bold recursive solution

defmodule Strain do
  def keep([head | tail] , fun) do
    if fun.(head) do
      [head | keep(tail, fun)]
    else
      keep(tail, fun)
    end
  end

  def keep([], _fun) do
    []
  end

  def discard([head|tail], fun) do
    if fun.(head) do
      discard(tail, fun)
    else
      [head | discard(tail, fun)]
    end
  end

  def discard([], _fun) do
    []
  end
end
