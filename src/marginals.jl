# Utils
export plot_marginal!
function plot_marginal!(p::AbstractPlot, epm::FluxEPModelT0, rxn; 
        sample_xbins = 1000, 
        sample_digits = 15, 
        pkwargs...
    )

    rxn = rxnindex(epm, rxn)

    μ, σ = untruncated_mean(epm, rxn), untruncated_var(epm, rxn)
    l, u = lb(epm, rxn), ub(epm, rxn)

    xs, ys = MetXBase.sample_tnorm(
        μ, σ, l, u; 
        xbins = sample_xbins, 
        digits = sample_digits
    )
    plot!(p, xs, ys; pkwargs...)
end

export plot_marginal
plot_marginal(epm::FluxEPModelT0, rxn; kwargs...) =
    plot_marginal!(plot(), epm::FluxEPModelT0, rxn; kwargs...)
