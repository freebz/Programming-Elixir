# 23.1.2 비헤이비어 선언하기

defmodule Mix.SCM.Git do
  @behaviour Mix.SCM

  def fetchable? do
    true
  end

  def format(opts) do
    opts[:git]
  end

  # ...
end
