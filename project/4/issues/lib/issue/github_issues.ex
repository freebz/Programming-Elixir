# 코드: project/3a/issues/lib/issues/github_issues.ex

defmodule Issues.GithubIssues do
  @user_agent [ {"User-agent", "Elixir dave@pragprog.com"} ]
  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  # 컴파일 시점에 값을 가져오기 위해 모듈 속성을 사용한다.
  @github_url Application.get_env(:issues, :github_url)

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({ _, %{status_code: status_code, body: body}}) do
    {
      status_code |> check_for_error(),
      body        |> Poison.Parser.parse!(%{})
    }
  end

  def check_for_error(200), do: :ok
  def check_for_error(_), do: :error
end
