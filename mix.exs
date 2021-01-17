defmodule ElixirDiscord.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_discord,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirDiscord, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:nostrum, "~> 0.4"}
    ]
  end
end
