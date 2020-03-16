using Plots
using DataFrames
using CSV
using CSVFiles
using GLM
using StatsModels
using DataFramesMeta



plot(rand(10), rand(10))
bar(rand(10))

df = DataFrame(a = rand(4), b = [1,1,1,1], y = rand(4), x = randn(4))

ols = lm(@formula(y~x), df)
g = glm(@formula(y~x), df, Normal(), IdentityLink())

show(g)

f1 = DataFrame(CSV.File("dummy.csv"))
f2 = DataFrame(load("dummy.csv"))

@where(df, :x .> 1)
@select(df, :x, :y)
@transform(df, newCol = cos.(:x), anotherCol = :x.^2 + 3*:x .+ 4)

categorical!(f1,:z)

