"""
    _ρ₁(x::OInterval, y::OInterval, μ::M_TYPE) -> OInterval

Return the distance between the first and the third bodies:

``ρ_1^2(x, y, μ) = (x + μ)^2 + y^2.``

# Arguments
- `x::OInterval`: the interval of coordinates of the third body on the abscissa
- `y::OInterval`: the interval of coordinates of the third body on the ordinate
- `μ::`[`M_TYPE`](@ref): the mass (dimensionless) of the smaller of the two resting bodies

# Returns
- `OInterval`: the interval of distances

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

(HillRegions.Internal._ρ₁(x, y, μ) == √((x + μ)^2 + y^2)) == TRUE

# output

true
```
"""
function _ρ₁(x::OInterval, y::OInterval, μ::M_TYPE)::OInterval
    return √((x + μ)^2 + y^2)
end
