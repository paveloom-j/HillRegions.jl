module TestRegression

using HillRegions
using Plots
using Suppressor
using Test
using VisualRegressionTests

GKSwstype = get(ENV, "GKSwstype", "")
ENV["GKSwstype"]="100"

@testset "Regression" begin
    @suppress @plottest(
        plot(HillRegion(1//11, 3.652916); no_velocity=true),
        joinpath(@__DIR__, "ref.png"),
        false,
        0.001
    )
end

ENV["GKSwstype"] = GKSwstype

end
