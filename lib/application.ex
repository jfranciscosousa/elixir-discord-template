defmodule ElixirDiscord do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: ElixirDiscordWeb.Endpoint,
        options: [port: System.get_env("PORT", "4000") |> String.to_integer()]
      ),
      ElixirDiscordWeb.Bot
    ]

    opts = [strategy: :one_for_one, name: :elixir_discord]

    Supervisor.start_link(children, opts)
  end
end
