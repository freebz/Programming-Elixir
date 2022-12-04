# 4.9 변수의 스코프

# 4.9.1 Do 블록 스코프

line_no = 50
# ...
if (line_no == 50) do
  IO.puts. "new-page\f"
  line_no = 0
end

IO.puts line_no
