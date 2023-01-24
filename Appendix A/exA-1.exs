# A.1 예외 생성하기

raise "Giving up"
# ** (RuntimeError) Giving up


raise RuntimeError
# ** (RuntimeError) runtime error
raise RuntimeError, message: "override message"
# ** (RuntimeError) override message


c("exception.ex")
# [Boom]
Boom.start 1
# Abouot to divide by zero
# %ArithmeticError{message: "bad argument in arithmetic expression"}
# Uh-oh! Arithmetic error
# DONE!
# ** (RuntimeError) too late, we're doomed
#     exception.ex:27: Boom.raise_error/1
#     exception.ex:6: Boom.start/1
Boom.start 2
# About to call a function that doesn't exist
# no function match or runtime error
# DONE!
# :ok
Boom.start 3
# About to try creating a directory with no permission
# Disaster! %File.Error{action: "make directory", path: "/not_allowed", reason: :eacces}
# DONE!
# :ok
