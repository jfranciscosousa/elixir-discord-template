defmodule OtherPingTest do
  use ExUnit.Case

  test "greets the world" do
    assert ElixirDiscord.OtherPing.call() == "other_pong!"
  end
end
