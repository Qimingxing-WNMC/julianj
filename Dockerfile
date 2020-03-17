FROM julia:1.3
# Add Packages based on : https://github.com/JuliaPlots/Plots.jl/blob/master/.travis.yml#L18
RUN apt-get update \
    && apt-get install build-essential  -y && \
    apt-get install qt5-default -y 

RUN apt-get install x11-apps xauth -y

COPY add_precompiled.jl .
COPY compile.jl .
COPY dummy.csv .
COPY precompile_statements.jl .

RUN julia add_precompiled.jl
RUN julia -e 'using Pkg; pkg"precompile"'
RUN julia compile.jl

CMD ["julia"]
