@recipe function f(
        HR::HillRegion;
        bodiesmarker=:x,
        bodiescolor=colorant"#425378",
        shapecolor=colorant"#425378",
    )

    @assert isa(bodiesmarker, Symbol) "`bodiesmarker` should of type `Symbol`"
    @assert(
        isa(shapecolor, Union{RGB, Symbol}),
        "`shapecolor` should be of type `RGB` or `Symbol`",
    )
    @assert(
        isa(bodiescolor, Union{RGB, Symbol}),
        "`bodiescolor` should be of type `RGB` or `Symbol`",
    )

    μ = MR_TYPE(HR.μ)
    dpi --> 320

    # Left and right bodies
    @series begin
        markercolor --> bodiescolor
        markershape --> bodiesmarker
        seriestype --> :scatter
        ([-μ, 1 - μ], [0., 0.])
    end

    # Hill region
    @series begin
        fillcolor --> shapecolor
        _predicate(HR)
    end

    return nothing
end
