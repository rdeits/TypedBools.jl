using TypedBools

import Documenter
Documenter.makedocs(
    modules = [TypedBools],
    format = :html,
    sitename = "TypedBools.jl",
    root = joinpath(dirname(dirname(@__FILE__)), "docs"),
    pages = Any["Home" => "index.md"],
    strict = true,
    linkcheck = true,
    checkdocs = :exports,
    authors = "Brandon Taylor"
)
