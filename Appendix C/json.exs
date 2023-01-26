# 코드: json.exs

Mix.install([:jason])

defmodule Decoder do
  def decode_file(file_name) do
    {:ok, payload} = File.read(file_name)
    Jason.decode(payload)
  end
end
