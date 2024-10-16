module MetXPlots

    using MetXBase
    using MetXBase.MassExport
    using MetXEP
    using Reexport
    
    @reexport using Plots
    
    #! include .
    include("marginals.jl")

end