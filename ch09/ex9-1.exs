# 9.1 엘릭서에서 타입이란

options = [ {:width, 72}, {:style, "light"}, {:style, "print"} ]
# [width: 72, style: "light", style: "print"]
List.last options
# {:style, "print"}
Keyword.get_values options, :style
# ["light", "print"]
