defmodule Caddr.MixProject do
  use Mix.Project

  def project do
    [
      app: :caddr,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      package: [
	licenses: ["apache-2.0"],
	name: "ex_utils_caddr",
	links: %{
	  "github" => "https://github.com/jamesandariese/ex-utils-caddr"
	},
	maintainers: [
	  "James Andariese (caddr) <james@strudelline.net>"
	],
	description: """
	  Things I didn't want to have to write again.
	"""
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
