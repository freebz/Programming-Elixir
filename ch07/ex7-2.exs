# 7.2 머리와 꼬리를 사용해 리스트 처리하기

[99, 97, 116]
# 'cat'
[99, 97, 116, 0]		# '0'은 문자로 출력할 수 없다
# [99, 97, 116, 0]


c "mylist.exs"
# warning: variable "head" is unused (if the variable is not meant to be used, prefix it with an underscore)
#   mylist.exs:5: MyList.len/1

# [MyList]
MyList.len([])
# 0
MyList.len([11,12,13,14,15])
# 5


c "mylist1.exs"
# [MyList]
MyList.len([1,2,3,4,5])
# 5
MyList.len(["cat", "dog"])
# 2
