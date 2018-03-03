module TypedBools

import Base: convert, &, |, ifelse
"""
    abstract TypedBool

There are two TypedBools: `True` and `False`. They can be converted to `Bool`s.
Logical operations and ifelse are defined for them. Using TypedBools can lead to
type stability in cases where constant propogation is not working for Bools.

```jldoctest
julia> using TypedBools, Base.Test

julia> if_unstable(x) = Bool(x) ? 1 : "a";

julia> ifelse_unstable(x) = ifelse(x, 1, "a");

julia> @inferred if_unstable(not(True() & True() & False()))
1

julia> @inferred if_unstable(False() & False() & True())
"a"

julia> @inferred ifelse_unstable(not(True() | True() | False()))
"a"

julia> @inferred ifelse_unstable(False() | False() | True())
1

julia> @inferred if_unstable(typed(true) & typed(false))
"a"
```
"""
abstract type TypedBool end
struct True <: TypedBool end
struct False <: TypedBool end

export True
export False

export typed
typed(x) =
    if x
        True()
    else
        False()
    end

Base.convert(::Type{Bool}, ::True) = true
Base.convert(::Type{Bool}, ::False) = false

(&)(::False, ::False) = False()
(&)(::False, ::True) = False()
(&)(::True, ::False) = False()
(&)(::True, ::True) = True()

(|)(::False, ::False) = False()
(|)(::False, ::True) = True()
(|)(::True, ::False) = True()
(|)(::True, ::True) = True()

export not
"""
    not(::False) = True()
    not(::True) = False()

```jldoctest
julia> using TypedBools

julia> not(True())
TypedBools.False()

julia> not(False())
TypedBools.True()
```
"""
not(::False) = True()
not(::True) = False()

ifelse(switch::False, new, old) = old
ifelse(switch::True, new, old) = new

end
