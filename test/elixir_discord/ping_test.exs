defmodule PingTest do
  use ExUnit.Case

  test "greets the world" do
    assert ElixirDiscord.Ping.call() == "pong!"
  end
end
