# 코드: project/5/issues/lib/issues/github_issues.ex

defmodule Issues.GithubIssues do
  require Logger
  @user_agent [ {"User-agent", "Elixir dave@pragprog.com"} ]

  # 컴파일 시점에 값을 가져오기 위해 모듈 속성을 사용한다.
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    Logger.info("Fetching #{user}'s project #{project}")
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({ _, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status code=#{status_code}")
    Logger.debug(fn -> inspect(body) end)
    {
      status_code |> check_for_error(),
      body        |> Poison.Parser.parse!(%{})
    }
  end

  def check_for_error(200), do: :ok
  def check_for_error(_), do: :error
end
