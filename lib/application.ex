defmodule ElixirDiscord do
  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: ElixirDiscordWeb.Endpoint,
        options: [port: System.get_env("PORT", "4000") |> String.to_integer()]
      ),
      ElixirDiscordBot.Bot
    ]

    opts = [strategy: :one_for_one, name: :elixir_discord]

    Supervisor.start_link(children, opts)
  end
end
