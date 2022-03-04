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
      {:plug_cowboy, "~> 2.5"},
      {:nostrum, "~> 0.5"},
      # Fix a conflict between plug_cowboy and nostrum
      {:cowlib, "~> 2.11", hex: :remedy_cowlib, override: true}
    ]
  end
end
