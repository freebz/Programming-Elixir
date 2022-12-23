# 14.1 IEx를 사용한 디버깅

header = << 0, 1, 0, 8, 0, 120 >>
# <<0, 1, 0, 8, 0, 120>>
iex(2)> Buggy.parse_header header
# format: 1
# tracks: 8
# ** (FunctionClauseError) no function clause matching in Buggy.decode/1    
