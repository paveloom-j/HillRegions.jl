module HillRegions

export HillRegion

using Colors
using ImplicitEquations
using Parameters
using RecipesBase

@with_kw struct HillRegion
    μ::Rational
    C::Float64
end

function _predicate(HR::HillRegion; no_velocity::Bool)::ImplicitEquations.Pred
    @unpack μ, C = HR
    ρ₁(x, y) = √((x + μ)^2 + y^2)
    ρ₂(x, y) = √((x - 1 + μ)^2 + y^2)
    J(x, y) = 2 * μ / ρ₂(x, y) + 2 * (1 - μ) / ρ₁(x, y) +
              μ * ρ₂(x, y)^2 + (1 - μ) * ρ₁(x, y)^2
    V²(x, y) = x'^2 + y'^2
    Γ(x, y) = J(x, y) - V²(x, y)
    return no_velocity ? J ⩵ C : Γ ⩵ C
end

@recipe function f(
        HR::HillRegion;
        no_velocity=false,
        M=10,
        N=10,
        bodiesmarker=:x,
        markercolor=colorant"#425378",
        shapecolor=colorant"#425378",
        dpi=320,
    )

    @assert isa(M, Int) "`M` should be of type `Int`"
    @assert isa(N, Int) "`N` should be of type `Int`"
    @assert(
        isa(markercolor, Union{RGB, Symbol}),
        "`markercolor` should be of type `RGB` or `Symbol`",
    )
    @assert isa(bodiesmarker, Symbol) "`bodiesmarker` should of type `Symbol`"
    @assert(
        isa(shapecolor, Union{RGB, Symbol}),
        "`shapecolor` should be of type `RGB` or `Symbol`",
    )
    @assert isa(dpi, Int) "`dpi` should be of type `Int`"
    @assert isa(no_velocity, Bool) "`no_velocity` should be of type `Bool`"

    μ = Float64(HR.μ)
    dpi --> dpi

    # Left and right bodies
    @series begin
        markercolor --> markercolor
        markershape --> bodiesmarker
        seriestype --> :scatter
        ([-μ, 1 - μ], [0., 0.])
    end

    # Hill region
    @series begin
        fillcolor --> shapecolor
        M --> M
        N --> N
        _predicate(HR; no_velocity)
    end

    return nothing
end

end
