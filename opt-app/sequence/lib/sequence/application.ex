# 코드: opt-app/sequence/lib/sequence/application.ex

defmodule Sequence.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      { Sequence.Stash, Application.get_env(:sequence, :initial_number) },
      { Sequence.Server, nil },
    ]

    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
  
end
