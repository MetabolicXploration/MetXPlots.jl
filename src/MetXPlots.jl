module MetXPlots

    using MetX
    using Reexport
    
    @reexport using Plots
    
    #! include .
    include("marginals.jl")

end