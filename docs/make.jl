using Documenter, IteratorAsArrayDisguises

makedocs(
    modules = [IteratorAsArrayDisguises],
    format = Documenter.HTML(; prettyurls = get(ENV, "CI", nothing) == "true"),
    authors = "Gustavo Goretkin",
    sitename = "IteratorAsArrayDisguises.jl",
    pages = Any["index.md"]
    # strict = true,
    # clean = true,
    # checkdocs = :exports,
)

deploydocs(
    repo = "github.com/goretkin/IteratorAsArrayDisguises.jl.git",
)
