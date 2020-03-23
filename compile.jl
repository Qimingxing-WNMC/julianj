using PackageCompiler
create_sysimage([:DataFrames,:CSV, :CSVFiles, :DataFramesMeta, :GLM, :Plots, :StatsPlots, :GR, :StatsModels, :Distributions, :StatsFuns, :SpecialFunctions, :PlotUtils], replace_default = true, precompile_execution_file="precompile_statements.jl")

