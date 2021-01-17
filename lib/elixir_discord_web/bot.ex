defmodule ElixirDiscordWeb.Bot do
  use Nostrum.Consumer

  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def start(_type, _args) do
    start_link()
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do

    handle_message(msg.content, msg)
  end

  def handle_event(_event) do
    :noop
  end

  defp handle_message("!ping", msg) do
    Api.create_message(msg.channel_id, "pong")
  end

  defp handle_message(_, _msg) do
    :ignore
  end
end
