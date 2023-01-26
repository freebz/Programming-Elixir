%% B.1 타입 명세의 사용처

-spec return_error(integer(), any()) -> no_return().
return_error(Line, Message) ->
      throw({error, {Line, ?MODULE, Message}}).
