"""
    C_TYPE = Float64

A default type for the `C` arguments.
"""
const C_TYPE = Float64


"""
    MR_TYPE = Float64

A default `Real` type for the `μ` arguments.
"""
const MR_TYPE = Float64

"""
    M_TYPE = Union{Rational{Int}, Float64}

A default type for the `μ` arguments.
"""
const M_TYPE = Union{Rational{Int}, MR_TYPE}
