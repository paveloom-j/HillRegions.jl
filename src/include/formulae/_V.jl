"""
    _V(x::OInterval, y::OInterval, μ::Union{Rational{Int}, Float64}) -> Float64

Return the value on the zero-velocity surface given by the Jacobi constant:

``
V(x, y, μ) = 2 μ / ρ_2(x, y) + 2 (1 - μ) / ρ_1(x, y) + μ ρ_2^2(x, y) + (1 - μ) ρ_1^2(x, y).
``

# Arguments
- `x::OInterval`: the interval of coordinates of the third body on the abscissa
- `y::OInterval`: the interval of coordinates of the third body on the ordinate
- `μ::Union{Rational{Int}, Float64}`: the mass (dimensionless) of the smaller of the two
  resting bodies

# Returns
- `Float64`: the value of the function ``V``

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

ρ₁ = HillRegions.Internal._ρ₁
ρ₂ = HillRegions.Internal._ρ₂

(HillRegions.Internal._V(x, y, μ) == 2 * μ / ρ₂(x, y, μ) + 2 * (1 - μ) / ρ₁(x, y, μ) +
                                     μ * ρ₂(x, y, μ)^2 + (1 - μ) * ρ₁(x, y, μ)^2) == TRUE

# output

true
```
"""
function _V(x::OInterval, y::OInterval, μ::Union{Rational{Int}, Float64})::OInterval
    return 2 * μ / _ρ₂(x, y, μ) + 2 * (1 - μ) / _ρ₁(x, y, μ) +
           μ * _ρ₂(x, y, μ)^2 + (1 - μ) * _ρ₁(x, y, μ)^2
end
