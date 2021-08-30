defmodule RunLittleCodesTest do
  use ExUnit.Case
  doctest ListLength

  test "ListLengthModule" do
    assert ListLength.calc([1,2,3]) == 3
  end
end
