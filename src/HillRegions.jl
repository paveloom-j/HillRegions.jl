__precompile__()

"""
A complimentary package to add the recipe for
[`Plots.jl`](https://github.com/JuliaPlots/Plots.jl) for plotting Hill regions.

Links:
- [Repo](https://github.com/paveloom-j/HillRegions.jl)
- [Docs](https://paveloom-j.github.io/HillRegions.jl)
"""
baremodule HillRegions

export HillRegion

using Base
using Colors
using RecipesBase

"This module contains all inner parts of this package."
baremodule Internal

export HillRegion, _predicate

using Base
using ImplicitEquations: OInterval, Pred, ⩵
using UnPack

# Types
Base.include(Internal, "include/types/DefaultTypes.jl")
Base.include(Internal, "include/types/HillRegion.jl")

# Formulae
Base.include(Internal, "include/formulae/_ρ₁.jl")
Base.include(Internal, "include/formulae/_ρ₂.jl")
Base.include(Internal, "include/formulae/_V.jl")

# Predicate
Base.include(Internal, "include/_predicate.jl")

end

using .Internal

"f"
@recipe function f(
        HR::HillRegion;
        M=10,
        N=10,
        bodiesmarker=:x,
        bodiescolor=colorant"#425378",
        shapecolor=colorant"#425378",
    )

    @assert isa(M, Int) "`M` should be of type `Int`"
    @assert isa(N, Int) "`N` should be of type `Int`"
    @assert(
        isa(bodiescolor, Union{RGB, Symbol}),
        "`bodiescolor` should be of type `RGB` or `Symbol`",
    )
    @assert isa(bodiesmarker, Symbol) "`bodiesmarker` should of type `Symbol`"
    @assert(
        isa(shapecolor, Union{RGB, Symbol}),
        "`shapecolor` should be of type `RGB` or `Symbol`",
    )
    @assert isa(dpi, Int) "`dpi` should be of type `Int`"

    μ = M_TYPE(HR.μ)
    dpi --> 320

    # Left and right bodies
    @series begin
        markercolor --> bodiescolor
        markershape --> bodiesmarker
        seriestype --> :scatter
        ([-μ, 1 - μ], [0., 0.])
    end

    # Hill region
    @series begin
        fillcolor --> shapecolor
        M --> M
        N --> N
        _predicate(HR)
    end

    return nothing
end

apply_recipe(plotattributes::AbstractDict{Symbol,Any}, HR::HillRegion) =
RecipesBase.apply_recipe(plotattributes::AbstractDict{Symbol,Any}, HR::HillRegion)

@doc(
    @doc(RecipesBase.apply_recipe(plotattributes::AbstractDict{Symbol,Any}, HR::HillRegion)),
    apply_recipe
)

end
