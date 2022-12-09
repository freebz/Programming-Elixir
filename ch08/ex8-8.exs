# 8.7.1 구조체가 아닌 경우의 데이터 접근

report = %{ owner: %{ name: "Dave", company: "Pragmatic" }, severity: 1}
# %{owner: %{company: "Pragmatic", name: "Dave"}, severity: 1}
put_in(report[:owner][:company], "PragProg")
# %{owner: %{company: "PragProg", name: "Dave"}, severity: 1}
update_in(report[:owner][:name], &("Mr. " <> &1))
# %{owner: %{company: "Pragmatic", name: "Mr. Dave"}, severity: 1}
