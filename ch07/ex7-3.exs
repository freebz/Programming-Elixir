# 7.3 머리와 꼬리를 사용해 리스트 만들기

c "mylist1.exs"
# [MyList]
MyList.square []         # 첫 번째 정의에 매칭된다
# []
MyList.square [4,5,6]    # 두 번째 정의에 매칭된다
# [16, 25, 36]


c "mylist1.exs"
# [MyList]
MyList.add_1 [1000]
# [1001]
MyList.add_1 [4,6,8]
# [5, 7, 9]
