# 6.1 모듈 컴파일하기

Times.double(4)
# 8


c "times.exs"
# [Times]
Times.double(4)
# 8
Times.double(123)
# 246


Times.double("cat")
# ** (ArithmeticError) bad argument in arithmetic expression: "cat" * 2
#     :erlang.*("cat", 2)
#     times.exs:5: Times.double/1
