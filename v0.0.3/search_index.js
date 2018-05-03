var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#TypedBools.not-Tuple{TypedBools.False}",
    "page": "Home",
    "title": "TypedBools.not",
    "category": "method",
    "text": "not(x)\n\nNegate a TypedBool\n\njulia> using TypedBools\n\njulia> not(True())\nTypedBools.False()\n\njulia> not(False())\nTypedBools.True()\n\n\n\n"
},

{
    "location": "index.html#TypedBools.same_type-Union{Tuple{T,T}, Tuple{T}} where T",
    "page": "Home",
    "title": "TypedBools.same_type",
    "category": "method",
    "text": "same_type(a, b)\n\nCheck whether a and b are the same type, return a typed bool.\n\njulia> using TypedBools\n\njulia> same_type(Val{:a}(), Val{:a}())\nTypedBools.True()\n\njulia> same_type(Val{:a}(), Val{:b}())\nTypedBools.False()\n\n\n\n"
},

{
    "location": "index.html#TypedBools.typed-Tuple{Any}",
    "page": "Home",
    "title": "TypedBools.typed",
    "category": "method",
    "text": "typed(x)\n\nConvert a Bool to a TypedBool\n\njulia> using TypedBools, Base.Test\n\njulia> typed(false)\nTypedBools.False()\n\njulia> typed(true)\nTypedBools.True()\n\n\n\n"
},

{
    "location": "index.html#TypedBools.TypedBool",
    "page": "Home",
    "title": "TypedBools.TypedBool",
    "category": "type",
    "text": "abstract TypedBool\n\nThere are two TypedBools: True and False. They can be converted to Bools. Logical operations and ifelse are defined for them. Using TypedBools can lead to type stability in cases where constant propogation is not working for Bools.\n\njulia> using TypedBools\n\njulia> Bool(False())\nfalse\n\njulia> Bool(True())\ntrue\n\njulia> True() & True() & False()\nTypedBools.False()\n\njulia> False() & False() & True()\nTypedBools.False()\n\njulia> True() | True() | False()\nTypedBools.True()\n\njulia> False() | False() | True()\nTypedBools.True()\n\njulia> ifelse(True(), 1, 0)\n1\n\njulia> ifelse(False(), 1, 0)\n0\n\n\n\n"
},

{
    "location": "index.html#TypedBools.jl-1",
    "page": "Home",
    "title": "TypedBools.jl",
    "category": "section",
    "text": "Modules = [TypedBools]"
},

]}
