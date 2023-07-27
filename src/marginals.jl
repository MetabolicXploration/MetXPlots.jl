# # TODO: This is the correct, as proved by comparizon with MC.
# # Fix all, both in MetXEP, and MetXPlots
# function __plot_marginal3!(p::AbstractPlot, epm::FluxEPModelT0, rxn;
#         pkwargs...
#     )
#     rxn = colindex(epm, rxn)
    
#     # μ = [epm.μd; epm.μi]
#     # μ = μ[epm.idxmap_inv][rxn] * epm.scalefact
#     μ = [epm.vd; epm.vi]
#     μ = μ[epm.idxmap_inv][rxn] * epm.scalefact

#     s = [epm.sd; epm.si]
#     s = s[epm.idxmap_inv][rxn] * epm.scalefact^2

#     # s = [epm.σd; epm.σi]
#     # s = s[epm.idxmap_inv][rxn] * epm.scalefact^2

#     l, u = lb(epm, rxn), ub(epm, rxn)

#     tQ = truncated(Normal(μ, sqrt(s)), l, u)
#     xs = range(l, u; length = 5000)
#     ys = pdf.(tQ, xs)
#     plot!(xs, ys; pkwargs...)
# end

function plot_marginal!(p::AbstractPlot, epm::FluxEPModelT0, rxn; 
        sample_xbins = 1000, 
        sample_digits = 15, 
        pkwargs...
    )
    xs, ws = sample_tnorm(epm, rxn; 
        xbins = sample_xbins, digits = sample_digits
    )
    plot!(p, xs, ws; pkwargs...)
end