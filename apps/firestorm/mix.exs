defmodule Firestorm.MixProject do
  use Mix.Project

  def project do
    [
      app: :firestorm,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Firestorm.Application, []},
      extra_applications: [:logger, :runtime_tools, :phoenix_ecto]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0"},
      {:phoenix_ecto, "~> 4.0.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:absinthe, "~> 1.4"},
      {:faker, "~> 0.10"},
      {:ex_machina, "~> 2.3", only: :test},
      {:absinthe_plug, "~> 1.4"},
      {:absinthe_phoenix, "~> 1.4"},
      {:corsica, "~> 1.1"},
      {:ecto, "~> 3.0"},
      {:torch, "~> 2.0"},
      {:dataloader, "~> 1.0"},
      {:gravity, "~> 1.0"},
      {:firestorm_data, in_umbrella: true}
    ]
  end
end
