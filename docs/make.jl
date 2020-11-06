using Documenter # A package to manage documentation
using HillRegions # A package to create the documentation for

# Create documentation
makedocs(
    # Specify modules being used
    modules = [HillRegions],

    # Specify a name for the site
    sitename = "HillRegions.jl",

    # Specify the author
    authors = "Pavel Sobolev",

    # Specify the pages on the left side
    pages = [
        "Home" => "index.md",
    ],

    # Specify a format
    format = Documenter.HTML(
            # Custom assets
            # assets = ["assets/custom.css"],
            # A fallback for creating docs locally
            prettyurls = get(ENV, "CI", nothing) == "true",
        ),

    # Fail if any error occurred
    strict = true,
)

# Deploy documentation
deploydocs(
    # Specify a repository
    repo = "github.com/paveloom-j/HillRegions.jl.git",

    # Specify a development branch
    devbranch = "develop",
)
