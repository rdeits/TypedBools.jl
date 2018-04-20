module TypedBools

import Base: convert, &, |, ifelse
"""
    abstract TypedBool

There are two TypedBools: `True` and `False`. They can be converted to `Bool`s.
Logical operations and ifelse are defined for them. Using TypedBools can lead to
type stability in cases where constant propogation is not working for Bools.

```jldoctest
julia> using TypedBools

julia> Bool(False())
false

julia> Bool(True())
true

julia> True() & True() & False()
TypedBools.False()

julia> False() & False() & True()
TypedBools.False()

julia> True() | True() | False()
TypedBools.True()

julia> False() | False() | True()
TypedBools.True()

julia> ifelse(True(), 1, 0)
1

julia> ifelse(False(), 1, 0)
0
```
"""
abstract type TypedBool end
struct True <: TypedBool end
struct False <: TypedBool end

export True
export False

export typed
"""
    typed(x)

Convert a Bool to a TypedBool

```jldoctest
julia> using TypedBools, Base.Test

julia> typed(false)
TypedBools.False()

julia> typed(true)
TypedBools.True()
```
"""
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
    not(x)

Negate a TypedBool

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

export same_type
"""
    same_type(a, b)

Check whether `a` and `b` are the same type, return a typed bool.

```jldoctest
julia> using TypedBools

julia> same_type(Val{:a}(), Val{:a}())
TypedBools.True()

julia> same_type(Val{:a}(), Val{:b}())
TypedBools.False()
```
"""
same_type(a::T, b::T) where T = True()
same_type(a, b) = False()

end
