# [Package Guide](@id Guide)

This package is for easy plotting of zero-velocity curves (aka Hill curves) for the general
[three-body problem](https://en.wikipedia.org/wiki/Three-body_problem). These curves become
[zero-velocity surfaces](https://en.wikipedia.org/wiki/Zero-velocity_surface) in
three-dimensional space that bound a region called the Hill region. It is a region that the
third body cannot leave. The problem is narrowed down to specifying the
[Jacobi constant](https://en.wikipedia.org/wiki/Jacobi_integral) and
the lesser of the two masses of the resting bodies.

## Installation

This package is an implementation of a learning assignment and solves a very narrow problem,
so it is not available in the [General](https://github.com/JuliaRegistries/General)
registry. You can get it from the
[PaveloomRegistry](https://github.com/paveloom-j/PaveloomRegistry), though.

First off, you need to add the registry: from the Julia REPL, type `]` to enter the Pkg
REPL mode and run:

```
pkg> registry add https://github.com/paveloom-j/PaveloomRegistry
```

Then you can install the package:

```
pkg> add HillRegions
```

## Plotting Hill curves

This package provides a [recipe](@ref Recipe) for the
[`Plots.jl`](https://github.com/JuliaPlots/Plots.jl) package. It is necessary to create
an instance of the [`HillRegion`](@ref) type to use it, specifying the lesser of the
masses of two resting bodies (in the co-rotating system) and the Jacobi constant:

```@example ex
using HillRegions
HR = HillRegion(μ = 1//11, C = 3.652916)
```

Now you can plot the Hill curves:

```@example ex
using Plots
ENV["GKSwstype"]="100" # hide
plot(HR, M=12, N=12)
```

Crosses mark the positions of two resting bodies at coordinates `-μ` and `1 - μ`.

To find out more about the additional arguments provided by the recipe, check the
[Recipe](@ref) page.
