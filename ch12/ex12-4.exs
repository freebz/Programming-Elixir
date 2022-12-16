# 12.4 예외 발생시키기

raise "Giving up"
# ** (RuntimeError) Giving up


raise RuntimeError
# ** (RuntimeError) runtime error
raise RuntimeError, message: "override message"
# ** (RuntimeError) override message
