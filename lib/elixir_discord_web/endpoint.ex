defmodule ElixirDiscordWeb.Endpoint do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Hello friend!")
  end

  match _ do
    send_resp(conn, 404, "")
  end
end
