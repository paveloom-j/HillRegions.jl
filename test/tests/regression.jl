# This file contains the tests
# for the plots of Hill regions

module TestRegression

using HillRegions
using Plots
using Test
using VisualRegressionTests

GKSwstype = get(ENV, "GKSwstype", "")
ENV["GKSwstype"]="100"

@plottest(
    plot(HillRegion(1//11, 3.652916); no_velocity=true),
    joinpath(@__DIR__, "ref.png"),
    false,
    0.001
)

ENV["GKSwstype"] = GKSwstype

end
