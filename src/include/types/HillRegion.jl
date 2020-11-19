"""
    HillRegion

Hill region, described by the lesser of the two masses of the resting bodies (``μ``)
and the Jacobi constant (``C``).

# Fields
- `μ::`[`M_TYPE`](@ref): the lesser of the two masses of the resting bodies
- `C::`[`C_TYPE`](@ref): the Jacobi constant

# Constructors
- `HillRegion(; μ::M_TYPE, C::C_TYPE)`
- `HillRegion(C::C_TYPE; μ::M_TYPE)`
- `HillRegion(μ::M_TYPE; C::C_TYPE)`
- `HillRegion(μ::M_TYPE, C::C_TYPE)`
"""
Base.@kwdef struct HillRegion
    μ::M_TYPE
    C::C_TYPE
end

HillRegion(μ::M_TYPE; C::C_TYPE) = HillRegion(μ, C)
