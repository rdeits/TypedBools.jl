var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#TypedBools.TypedBool",
    "page": "Home",
    "title": "TypedBools.TypedBool",
    "category": "Type",
    "text": "abstract TypedBool\n\nThere are two TypedBools: True and False. They can be converted to Bools. Logical operations and ifelse are defined for them. Using TypedBools can lead to type stability in cases where constant propogation is not working for Bools.\n\njulia> using TypedBools, Base.Test\n\njulia> if_unstable(x) = Bool(x) ? 1 : \"a\";\n\njulia> ifelse_unstable(x) = ifelse(x, 1, \"a\");\n\njulia> @inferred if_unstable(!(True() & True() & False()))\n1\n\njulia> @inferred if_unstable(False() & False() & True())\n\"a\"\n\njulia> @inferred ifelse_unstable(!(True() | True() | False()))\n\"a\"\n\njulia> @inferred ifelse_unstable(False() | False() | True())\n1\n\n\n\n"
},

{
    "location": "index.html#TypedBools.jl-1",
    "page": "Home",
    "title": "TypedBools.jl",
    "category": "section",
    "text": "Modules = [TypedBools]"
},

]}
