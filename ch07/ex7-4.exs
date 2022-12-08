# 7.4 맵 함수 만들기

c "mylist1.exs"
# [MyList]
MyList.map [1,2,3,4], fn (n) -> n*n end
# [1, 4, 9, 16]


MyList.map [1,2,3,4], fn (n) -> n+1 end
# [2, 3, 4, 5]


MyList.map [1,2,3,4], fn (n) -> n > 2 end
# [false, false, true, true]


MyList.map [1,2,3,4], &(&1 + 1)
# [2, 3, 4, 5]
MyList.map [1,2,3,4], &(&1 > 2)
# [false, false, true, true]
