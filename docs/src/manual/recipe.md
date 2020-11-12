# Recipe

The recipe's function signature looks like this:

```julia
function f(
    HR::HillRegion;
    bodiesmarker=:x,
    bodiescolor=colorant"#425378",
    shapecolor=colorant"#425378",
)
```

Keyword arguments:
- `bodiesmarker`: the marker shape for displaying resting bodies
- `bodiescolor`: the color of the markers for resting bodies
- `shapecolor`: the Hill curves color

Note that this recipe inherits the recipe parameters from the
[`ImplicitEquations.jl`](https://github.com/jverzani/ImplicitEquations.jl) package, so those
can be changed, too. In particular, the parameters `M` and `N` are responsible for
the resolution when using the Tupper algorithm. See the
[source file](https://github.com/jverzani/ImplicitEquations.jl/blob/master/src/plot_recipe.jl)
for details.
