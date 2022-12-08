# 7.6 더 복잡한 리스트 패턴

[ 1, 2, 3 | [ 4, 5, 6 ]]
# [1, 2, 3, 4, 5, 6]


c "swap.exs"
# [Swapper]
Swapper.swap [1,2,3,4,5,6]
# [2, 1, 4, 3, 6, 5]
Swapper.swap [1,2,3,4,5,6,7]
# ** (RuntimeError) Can't swap a list with an odd number of elements
