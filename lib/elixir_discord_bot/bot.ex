defmodule ElixirDiscordBot.Bot do
  use Nostrum.Consumer

  alias ElixirDiscordBot.MessageHandler

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def start(_type, _args) do
    start_link()
  end

  # Use pattern matching to match against discord events
  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    MessageHandler.call(msg.content, msg)
  end

  # We need this fallback otherwise the app would crash
  def handle_event(_event) do
    :noop
  end
end
