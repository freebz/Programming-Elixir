# A.2 catch, exit, throw

c("catch.ex")
# [Catch]
Catch.start 1
# "Exited with code :something_bad_happened"
Catch.start 2
# "throw called with {:animal, \"wombat\"}"
Catch.start 3
# "Caught :error with \"Oh no!\""



try do
  raise "Giving up"
catch
  :error, error -> "Error with #{inspect(error)}"
end
# "Error with %RuntimeError{message: \"Giving up\"}"


try do
  :erlang.error(:badarg)
rescue
  e -> inspect(e)
end
# "%ArgumentError{message: \"argument error\"}"


try do
  throw {:animal, "wombat"}
catch
  throw_error -> inspect(throw_error)
  :throw, error -> "thrown with #{inspect(error)}"
end
# "{:animal, \"wombat\"}"


try do
  throw {:animal, "wombat"}
rescue
  e -> inspect(e)
end
# ** (throw) {:animal, "wombat"}
