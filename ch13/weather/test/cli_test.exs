defmodule CliTest do
  use ExUnit.Case
  doctest Weather

  import Weather.CLI, only: [ parse_args: 1 ]

  test "-h나 --help가 옵션으로 파싱되면 :help가 반환된다." do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "값을 하나 전달하면 단위 튜플을 반환한다." do
    assert parse_args(["KDTO"]) == { "KDTO" }
  end
end
