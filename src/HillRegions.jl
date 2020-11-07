__precompile__()

"""
A complimentary package to add the recipe to
[`Plots.jl`](https://github.com/JuliaPlots/Plots.jl) for plotting Hill regions.

Links:
- [Repository](https://github.com/paveloom-j/HillRegions.jl)
- [Documentation](https://paveloom-j.github.io/HillRegions.jl)
"""
baremodule HillRegions

export HillRegion

"This module contains all inner parts of this package."
baremodule Internal

export HillRegion

using Base
using Colors
using ImplicitEquations: OInterval, Pred, ⩵
using RecipesBase
using UnPack

# Types
Base.include(Internal, "include/types/DefaultTypes.jl")
Base.include(Internal, "include/types/HillRegion.jl")

# Formulae
Base.include(Internal, "include/formulae/_ρ₁.jl")
Base.include(Internal, "include/formulae/_ρ₂.jl")
Base.include(Internal, "include/formulae/_V.jl")

# Predicate
Base.include(Internal, "include/_predicate.jl")

# Recipe
Base.include(Internal, "include/@recipe.jl")

end

using .Internal

end
