__precompile__()

"f"
baremodule HillRegions

export HillRegion

using Base
using Colors
using RecipesBase

"f"
baremodule Internal

export HillRegion, _predicate

using Base
using ImplicitEquations: OInterval, Pred, ⩵
using Parameters

# Type
Base.include(Internal, "include/HillRegion.jl")

# Formulae
Base.include(Internal, "include/formulae/_ρ₁.jl")
Base.include(Internal, "include/formulae/_ρ₂.jl")
Base.include(Internal, "include/formulae/_V.jl")

# Predicate
Base.include(Internal, "include/_predicate.jl")

end

using .Internal

@recipe function f(
        HR::HillRegion;
        M=10,
        N=10,
        bodiesmarker=:x,
        bodiescolor=colorant"#425378",
        shapecolor=colorant"#425378",
        dpi=320,
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

    μ = Float64(HR.μ)
    dpi --> dpi

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

end
