# 코드: opt-app/sequence_v3/mix.exs

defmodule Sequence.MixProject do
  use Mix.Project

  def project do
    [
      app: :sequence,
      version: "0.4.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {
        Sequence.Application, []
      },
      registered: [
        Sequence.Server,
      ],
      extra_applications: [:logger],
      env: [initial_state: %{ current_number: 456, delta: 1 }]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 2.1", runtime: false },
    ]
  end
end
