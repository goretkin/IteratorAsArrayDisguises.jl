using IteratorAsArrayDisguises
using Test

needlessly_restricted_maximum(x::AbstractArray) = maximum(x)

@testset "needlessly restricted maximum" begin
    generator = (rand() for _ = 1:10)
    disguised = IteratorAsArrayDisguises.IteratorAsArrayDisguise(generator)
    @test needlessly_restricted_maximum(disguised) ≥ 0
end
