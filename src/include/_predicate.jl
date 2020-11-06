"""
    _predicate(HR::HillRegion) -> ImplicitEquations.Pred

Return a predicate in the form of ``V = C`` where ``μ`` and ``C`` are from a
[`HillRegion`](@ref) object.

# Arguments
- `HR::`[`HillRegion`](@ref): a Hill region

# Returns
- `ImplicitEquations.Pred`: a predicate

# Example
```jldoctest; output = false
using HillRegions
using ImplicitEquations

x = y = 1.
μ = 1//11
C = 3.0

pred = HillRegions.Internal._predicate(HillRegion(μ, C))
pred.f(x, y) == HillRegions.Internal._V(x, y, μ)

# output

true
```

See also: [`_V`](@ref), [`_ρ₁`](@ref), [`_ρ₂`](@ref)
"""
function _predicate(HR::HillRegion)::ImplicitEquations.Pred
    @unpack μ, C = HR
    return ((x::Float64, y::Float64) -> _V(x, y, μ)) ⩵ C
end
