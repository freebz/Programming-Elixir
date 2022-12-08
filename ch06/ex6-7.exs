# 6.6 프라이빗 함수

def fun(a) when is_list(a), do: true
defp fun(a), do: false
