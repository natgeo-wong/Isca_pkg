function [ u,v,q,T ] = isca_flux_extract (yr,root,spin)



upar = isca_par(3);  u = isca_par_ncread_cat(upar,yr,root,spin);
vpar = isca_par(4);  v = isca_par_ncread_cat(vpar,yr,root,spin);
Tpar = isca_par(6);  T = isca_par_ncread_cat(Tpar,yr,root,spin);
qpar = isca_par(12); q = isca_par_ncread_cat(qpar,yr,root,spin);

end