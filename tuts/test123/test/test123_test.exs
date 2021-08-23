defmodule Test123Test do
  use ExUnit.Case
  doctest Test123

  test "greets the world" do
    assert Test123.hello() == :world
  end
end
