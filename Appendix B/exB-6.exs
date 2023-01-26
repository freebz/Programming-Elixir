# B.4 함수와 콜백의 타입 명세

@spec function_name(param1_type, ...) :: return_type


@type key   :: any
@type value :: any
@type keys  :: [ key ]
@type t        :: tuple | lsit	# t는 컬렉션 타입으로 정의되었다

@spec values(t) :: [value]
@spec size(t) :: non_neg_integer
@spec has_key?(t, key) :: boolean
@spec update(t, key, value, (value -> value)) :: t


@spec at(t, index) :: element | nil
@spec at(t, index, default) :: element | default

def at(collection, n, default \\ nil) when n >= 0 do
  ...
end


@spec filter(t, (element -> as_boolean(term))) :: list
def filter(collection, fun) when is_list(collection) do
  ...
end
