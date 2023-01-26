# C.4 정렬 기능 개선 (1.10)

Enum.sort([1, 3, 5, 2, 4, 6], &>=/2)
# [6, 5, 4, 3, 2, 1]


Enum.sort([1, 3, 5, 2, 4, 6], :asc)
# [1, 2, 3, 4, 5, 6]
Enum.sort([1, 3, 5, 2, 4, 6], :desc)
# [6, 5, 4, 3, 2, 1]


date_list = [~D[2020-12-31], ~D[2021-01-01], ~D[2019-07-01]]
# [~D[2020-12-31], ~D[2021-01-01], ~D[2019-07-01]]
Enum.sort(date_list, :desc)
# [~D[2020-12-31], ~D[2019-07-01], ~D[2021-01-01]]
inspect(date_list |> hd(), structs: false)
# "%{__struct__: Date, calendar: Calendar.ISO, day: 31, month: 12, year: 2020}"


Enum.sort(date_list, &(Date.compare(&1, &2) == :gt))
# [~D[2021-01-01], ~D[2020-12-31], ~D[2019-07-01]]


Enum.sort(date_list, Date)
# [~D[2019-07-01], ~D[2020-12-31], ~D[2021-01-01]]


Enum.sort(date_list, Date)
# [~D[2019-07-01], ~D[2020-12-31], ~D[2021-01-01]]
Enum.sort(date_list, {:desc, Date})
# [~D[2021-01-01], ~D[2020-12-31], ~D[2019-07-01]]

