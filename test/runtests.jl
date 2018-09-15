using Completion
using Rewrite
using Test


f(xs...) = Fn(:f, xs...)
g(xs...) = Fn(:g, xs...)
x, y, z = Variable.([:x, :y, :z])

include("unify.jl")
include("orders.jl")
include("complete.jl")
