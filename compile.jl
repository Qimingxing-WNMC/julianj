using PackageCompiler
 create_sysimage([:DataFrames,:CSV, :CSVFiles, :DataFramesMeta, :GLM, :Plots, :StatsPlots], replace_default = true, precompile_statements_file="precompile_statements.jl")

