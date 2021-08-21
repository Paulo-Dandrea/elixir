defmodule TestParsers do
  use ExUnit.Case

  test "ensure questions" do
    assert Parsers.ensure_question("") == "?"
    assert Parsers.ensure_question("Yes") == "Yes?"
    assert Parsers.ensure_question("No?") == "No?"
  end
end
