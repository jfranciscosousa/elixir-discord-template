defmodule ElixirDiscordWeb.MessageHandler do
  alias Nostrum.Api

  alias ElixirDiscord.{OtherPing, Ping}

  # Use pattern matching to handle incoming messages.
  def call("!ping", msg) do
    Api.create_message(msg.channel_id, Ping.call())
  end

  # Delegate logic to dedicated modules. This is good
  # because you can test them in isolation, and keep
  # the code more organized
  def call("!other_ping", msg) do
    Api.create_message(msg.channel_id, OtherPing.call())
  end

  # This handles unmatched messages otherwise the bot would
  # crash
  def call(_, _msg) do
    :ignore
  end
end
