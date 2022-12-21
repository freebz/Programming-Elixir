defmodule Weather.WeatherService do

  @weather_url Application.get_env(:weather, :weather_url)

  def fetch(station) do
    weather_url(station)
    |> HTTPoison.get
    |> handle_response
  end

  def weather_url(station) do
    "#{@weather_url}/#{station}.xml"
  end

  def handle_response({ _, %{status_code: status_code, body: body}}) do
    {doc, _} = body |> :erlang.binary_to_list |> :xmerl_scan.string()
    {
      status_code |> check_for_error(),
      doc
    }
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error
end
