# 23.1.1 비헤이비어 정의하기

defmodule Mix.SCM do
  @moduledoc """
  This module provides helper functions and defines the behaviour
  required by any SCM used by Mix.
  """

  @type opts :: Keyword.t

  @doc """
  Returns a boolean if the dependency can be fetched or it is meant to
  be previously available in the filesystem.
  Local dependencies (i.e. non fetchable ones) are automatically
  recompiled every time the parent project is compiled.
  """
  @callback fetchable? :: boolean

  @doc """
  Returns a string representing the SCM. This is used when printing
  the dependency and not for inspection, so the amount of infomation
  should be concise and easy to spot.
  """
  @callback format(opts) :: String.t

  # 이하 생략
