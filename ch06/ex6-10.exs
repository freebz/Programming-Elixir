# 6.8.1 모듈 지시자

defmodule Example do
  def compile_and_go(source) do
    alias My.Other.Module.Parser, as: Parser
    alias My.Other.Module.Runner, as: Runner
    source
    |> Parser.parse()
    |> Runner.execute()
  end
end


alias My.Other.Module.Parser
alias My.Other.Module.Runner


alias My.Other.Module.{Parser, Runner}
