module TestHillRegion

using HillRegions
using Test

@testset "HillRegion" begin

    μ = 1//11
    C = 3.652916

    @test_nowarn HillRegion(μ = μ, C = C)
    @test_nowarn HillRegion(C, μ = μ)
    @test_nowarn HillRegion(μ, C = C)
    @test_nowarn HillRegion(μ, C)

end

end
