function flux = isca_calc_flux (u,v,q,T)



flux.uv = isca_flux_prod(u,v);
flux.uq = isca_flux_prod(u,q); flux.vq = isca_flux_prod(v,q);
flux.uT = isca_flux_prod(u,T); flux.vT = isca_flux_prod(v,T);

end