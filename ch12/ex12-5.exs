# 12.5 예외를 이용해 설계하기

case File.open(user_file_name) do
  {:ok, file} ->
    process(file)
  {:error, message} ->
    IO.puts :stderr, "Couldn't open #{user_file_name}: #{message}"
end


case File.open("config_file") do
  {:ok, file} ->
    process(file)
  {:error, message} ->
    raise "Failed to open config file: #{message}"
end


{ :ok, file } = File.open("config_file")
process(file)


file = File.open!("config_file")
