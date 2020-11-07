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
using IntervalArithmetic

OInterval = HillRegions.Internal.OInterval
TRUE = ImplicitEquations.BInterval(true, true)

x = OInterval(Interval(-1., 1.), TRUE, TRUE)
y = OInterval(Interval(1., 1.), TRUE, TRUE)
μ = 1//11
C = 3.0

pred = HillRegions.Internal._predicate(HillRegion(μ, C))
(pred.f(x, y) == HillRegions.Internal._V(x, y, μ)) == TRUE

# output

true
```

See also: [`_V`](@ref), [`_ρ₁`](@ref), [`_ρ₂`](@ref)
"""
function _predicate(HR::HillRegion)::Pred
    @unpack μ, C = HR
    return ((x::OInterval, y::OInterval) -> _V(x, y, μ)) ⩵ C
end
