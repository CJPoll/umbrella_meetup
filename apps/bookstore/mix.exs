defmodule Bookstore.Mixfile do
  use Mix.Project

  def project do
    [app: :bookstore,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [mod: {Bookstore, []},
     applications: [:logger, :postgrex, :ecto]]
  end

  defp deps do
    [{:ecto, "~> 2.1.0"},
     {:postgrex, ">= 0.0.0"}]
  end
end
