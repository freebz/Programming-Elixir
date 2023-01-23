# 23.1.3 더 나아가기

defmodule Mix.SCM.Git do
  @behaviour Mix.SCM
  def init(arg) do   # 일반 함수
    # ...
  end

  @impl Mix.SCM      # 콜백
  def fetchable? do
    true
  end

  @impl Mix.SCM      # 콜백
  def format(opts) do
    opts[:git]
  end
