# 8.4 패턴 매칭하기, 맵 수정하기

person = %{ name: "Dave", height: 1.88 }


# 맵에 :name이라는 키가 있는가?
%{ name: a_name } = person
# %{height: 1.88, name: "Dave"}
a_name
# "Dave"


# 맵에 :name과 :height 키가 모두 있는가?
%{ name: _, height: _ } = person
# %{height: 1.88, name: "Dave"}


# :name 키의 값이 "Dave"인가?
%{ name: "Dave" } = person
# %{height: 1.88, name: "Dave"}


# :weight라는 키가 없어 패턴 매칭 실패
%{ name: _, weight: _ } = person
# ** (MatchError) no match of right hand side value: %{height: 1.88, name: "Dave"}
