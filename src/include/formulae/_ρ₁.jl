"""
    _ρ₁(x::Float64, y::Float64, μ::Union{Rational{Int}, Float64}) -> Float64

Return the distance between the first and the third bodies:

``ρ_1^2(x, y, μ) = (x + μ)^2 + y^2.``

# Arguments
- `x::Float64`: the abscissa of the third body
- `y::Float64`: the ordinate of the third body
- `μ::Union{Rational{Int}, Float64}`: the mass (dimensionless) of the smaller of the two
  resting bodies

# Returns
- `Float64`: the distance

# Example
```jldoctest; output = false
using HillRegions

x = y = 1.
μ = 1//11

HillRegions.Internal._ρ₁(x, y, μ) == √((x + μ)^2 + y^2)

# output

true
```
"""
function _ρ₁(x::Float64, y::Float64, μ::Union{Rational{Int}, Float64})::Float64
    return √((x + μ)^2 + y^2)
end
