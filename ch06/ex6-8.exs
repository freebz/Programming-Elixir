# 6.7 끝내주는 파이프 연산자: |>

(1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 < 40))
# [1, 4, 9, 16, 25, 36]
