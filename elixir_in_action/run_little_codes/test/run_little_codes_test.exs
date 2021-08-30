defmodule RunLittleCodesTest do
  use ExUnit.Case
  doctest RunLittleCodes

  test "greets the world" do
    assert RunLittleCodes.hello() == :world
  end
end
