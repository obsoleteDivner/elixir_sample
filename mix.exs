defmodule ElixirSample.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_sample,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ElixirSample.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:n2o, github: "synrc/n2o", branch: "master"},
      {:nitro, github: "synrc/nitro", branch: "master"},
      {:cowboy, "~> 2.9"},
      {:syn, "~> 2.1"}
    ]
  end
end
