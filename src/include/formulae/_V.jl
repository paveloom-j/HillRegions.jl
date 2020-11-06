"""
    _V(x::Float64, y::Float64, μ::Union{Rational{Int}, Float64}) -> Float64

Return the value on the zero-velocity surface given by the Jacobi constant:

``
V(x, y, μ) = 2 μ / ρ_2(x, y) + 2 (1 - μ) / ρ_1(x, y) + μ ρ_2^2(x, y) + (1 - μ) ρ_1^2(x, y).
``

# Arguments
- `x::Float64`: the abscissa of the third body
- `y::Float64`: the ordinate of the third body
- `μ::Union{Rational{Int}, Float64}`: the mass (dimensionless) of the smaller of the two
  resting bodies

# Returns
- `Float64`: the value of the function ``V``

# Example
```jldoctest; output = false
using HillRegions

x = y = 1.
μ = 1//11

ρ₁ = HillRegions.Internal._ρ₁
ρ₂ = HillRegions.Internal._ρ₂

HillRegions.Internal._V(x, y, μ) == 2 * μ / ρ₂(x, y, μ) + 2 * (1 - μ) / ρ₁(x, y, μ) +
                                    μ * ρ₂(x, y, μ)^2 + (1 - μ) * ρ₁(x, y, μ)^2

# output

true
```
"""
function _V(x::Float64, y::Float64, μ::Union{Rational{Int}, Float64})::Float64
    return 2 * μ / _ρ₂(x, y, μ) + 2 * (1 - μ) / _ρ₁(x, y, μ) +
           μ * _ρ₂(x, y, μ)^2 + (1 - μ) * _ρ₁(x, y, μ)^2
end
