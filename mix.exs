defmodule Project.MixProject do
  use Mix.Project

  def project do
    [
      app: :project,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Project.Application, []},
      extra_applications: [:logger, :runtime_tools, :rummage_ecto, :rummage_phoenix]
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
      {:phoenix, "~> 1.6.0", override: true},
      {:phoenix_ecto, "~> 4.4", override: true},
      {:ecto_sql, "~> 3.6", override: true},
      {:myxql, ">= 0.0.0", override: true},
      {:phoenix_html, "~> 3.0", override: true},
      {:phoenix_live_reload, "~> 1.2", only: :dev, override: true},
      {:phoenix_live_view, "~> 0.16.0", override: true},
      {:floki, ">= 0.30.0", only: :test, override: true},
      {:phoenix_live_dashboard, "~> 0.5", override: true},
      {:esbuild, "~> 0.2", runtime: Mix.env() == :dev, override: true},
      {:swoosh, "~> 1.3", override: true},
      {:telemetry_metrics, "~> 0.6", override: true},
      {:telemetry_poller, "~> 1.0", override: true},
      {:gettext, "~> 0.18", override: true},
      {:jason, "~> 1.2", override: true},
      {:plug_cowboy, "~> 2.5", override: true},
      {:rummage_phoenix, "~> 2.0.0", override: true},
      {:rummage_ecto, "~> 2.0.0", override: true},
      {:ex_heroicons, "~> 2.0.0", override: true}

    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"]
    ]
  end
end
