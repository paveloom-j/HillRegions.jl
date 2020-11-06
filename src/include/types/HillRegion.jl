"f"
Base.@kwdef struct HillRegion
    μ::M_TYPE
    C::C_TYPE
end

HillRegion(μ::M_TYPE; C::C_TYPE) = HillRegion(μ, C)
HillRegion(C::C_TYPE; μ::M_TYPE) = HillRegion(μ, C)
