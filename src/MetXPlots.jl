module MetXPlots

    using MetXBase
    using MetXEP
    using Reexport
    
    @reexport using Plots
    
    #! include .
    include("marginals.jl")

end