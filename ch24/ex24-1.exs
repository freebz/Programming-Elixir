# 24.1 프로토콜 정의하기

defprotocol Inspect do
  @fallback_to_any true
  def inspect(thing, opts)
end
