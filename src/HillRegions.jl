module HillRegions

export HillRegion

using ImplicitEquations
using Parameters
using RecipesBase

@with_kw struct HillRegion
    μ::Rational
    C::Float64
end

function _predicate(HR::HillRegion)::ImplicitEquations.Pred
    @unpack μ, C = HR
    V(x, y) = 2 * μ / √((x - 1 + μ)^2 + y^2) + 2 * (1 - μ) / √((x + μ)^2 + y^2) + x^2 + y^2
    return V ⩵ C
end

@recipe f(::Type{T}, HR::T) where {T<:HillRegion} = _predicate(HR)

end
