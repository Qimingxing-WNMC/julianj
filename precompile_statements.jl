using Plots
using DataFrames
using CSV
using CSVFiles
using GLM
using StatsModels
using DataFramesMeta
using Distributions
using GR
using StatsFuns
using SpecialFunctions
using PlotUtils

SpecialFunctions.erf(1.0)
SpecialFunctions.erfc(1.0)
SpecialFunctions.erfinv(1.0)
SpecialFunctions.erfc(1.0)
SpecialFunctions.erfcinv(1.0)
SpecialFunctions.digamma(1.0)
SpecialFunctions.trigamma(1.0)

StatsFuns.xlogy(1, 1)


p1 = plot(rand(10))
p2 = plot(rand(10), rand(10))
p3 = bar(rand(10))

display(p1)
display(p2)
display(p3)

nd = Normal()
rand(nd)
rand(nd, 100)
nchi = Chisq(1)
rand(nchi)
mn = MultivariateNormal(zeros(5), ones(5))
rand(mn)
rand(mn, 10)


df = DataFrame(a = rand(4), b = [1,1,1,1], y = rand(4), x = randn(4))

ols = lm(@formula(y~x), df)
round.(stderror(ols), digits=5)
round.(predict(ols), digits=5)


g = glm(@formula(y~x), df, Normal(), IdentityLink())
round.(stderror(g), digits=5)
round.(predict(g), digits=5)

f1 = DataFrame(CSV.File("dummy.csv"))
f2 = DataFrame(load("dummy.csv"))

@where(df, :x .> 1)
@select(df, :x, :y)
@transform(df, newCol = cos.(:x), anotherCol = :x.^2 + 3*:x .+ 4)

categorical!(f1,:z)
categorical!(f2,:z)
