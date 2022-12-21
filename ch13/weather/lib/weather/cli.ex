defmodule Weather.CLI do

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean], aliases: [ h: :help ])
    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [ station ], _ } -> { station }
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: weather <station>
    """
  end

  def process({ station }) do
    Weather.WeatherService.fetch(station)
    |> decode_response()
    |> print_table(["station_id", "location", "latitude", "longitude", "observation_time",
                    "weather", "temperature_string", "wind_string"])
  end

  def decode_response({:ok, body}) do
    body
  end
  def decode_response({:error, error}) do
    IO.puts "Error fetching from Weather: #{error["message"]}"
    System.halt(2)
  end

  def print_table(body, []), do: body
  def print_table(body, [key | rest]) do
    [{_, _, _, _, value, _}] = :xmerl_xpath.string('#{key}/text()', body)
    IO.puts "#{key}: #{value}"
    print_table(body, rest)
  end

end
