using Completion: LPO


@testset "lpo" begin
    >ₗₚₒ = LPO((:i, 1), (:f, 2), (:e, 0))
    @test !(@term(x) >ₗₚₒ @term(y))
    @test @term(f(x, e())) >ₗₚₒ @term(x)
    @test @term(i(e())) >ₗₚₒ @term(e())
    @test @term(i(f(x, y))) >ₗₚₒ @term(f(i(y), i(x)))
    @test @term(f(f(x, y), z)) >ₗₚₒ @term(f(x, f(y, z)))
    @test @term(f(x, y)) >ₗₚₒ @term(x)

    @test_throws ArgumentError("(:f, 1) is not contained in order") LPO((:i, 1))(@term(f(x)), @term(i(x)))
    @test_throws ArgumentError("(:g, 1) is not contained in order") LPO((:i, 1))(@term(i(x)), @term(g(x)))
end
