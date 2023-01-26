# B.3 새 타입 정의하기

@type type_name :: type_specification


@type term      :: any
@type binary    :: <<_::_*8>>
@type bitstring :: <<_::_*1>>
@type boolean   :: false | true
@type byte      :: 0..255
@type char      :: 0..0x10ffff
@type charList  :: [ char ]
@type list      :: [ any ]
@type list(t)   :: [ t ]
@type number    :: integer | float
@type module    :: atom
@type mfa       :: (module, atom, byte)
@type node      :: atom
@type nonempty_charlist  :: [ char ]
@type timeout   :: :infinity | non_neg_integer
@type no_return :: none


@type variant(type_name, type) :: {:variant, type_name, type}

@spec create_string_tuple(:string, String.t) :: variant(:string, String.t)
