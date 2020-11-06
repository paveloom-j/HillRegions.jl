"""
    _ρ₂(x::Float64, y::Float64, μ::Union{Rational{Int}, Float64}) -> Float64

Return the distance between the second and the third bodies:

``ρ_2^2(x, y, μ) = (x - 1 + μ)^2 + y^2.``

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

HillRegions.Internal._ρ₂(x, y, μ) == √((x - 1 + μ)^2 + y^2)

# output

true
```
"""
function _ρ₂(x::Float64, y::Float64, μ::Union{Rational{Int}, Float64})::Float64
    return √((x - 1 + μ)^2 + y^2)
end
