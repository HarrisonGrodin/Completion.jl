using Completion: unify, Unifier

@testset "unify" begin
    @test unify(x, x) == Unifier()
    @test unify(x, y) == Unifier(x => y)
    @test unify(y, x) == Unifier(y => x)

    @test unify(@term(2), @term(2)) == Unifier()
    @test unify(@term(1), @term(2)) === nothing
    @test unify(@term(1), @term(1.0)) === nothing

    @test unify(x, f(y)) == Unifier(x => f(y))
    @test unify(f(y), x) == Unifier(x => f(y))
    @test unify(x, f(x)) == nothing
    @test unify(f(x), f(y)) == Unifier(x => y)
    @test unify(f(x), g(y)) == nothing
    @test unify(g(x, x), g(y, z)) == Unifier(x => z, y => z)
    @test unify(g(f(x), x), g(f(y), z)) == Unifier(x => z, y => z)
    @test unify(g(f(x), x), g(y, y)) == nothing
    @test unify(g(f(x), x), g(y, z)) == Unifier(y => f(z), x => z)
    @test unify(f(x), f(x, y)) == nothing
end
