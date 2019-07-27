function [ u,v ] = isca_psi_extract (yr,root)



[ dfol,fnc ] = isca_dinfo(root.raw); cd([ root.raw '/' dfol(yr).name ]);

upar = isca_par(3); u = isca_par_ncread(fnc,upar);
vpar = isca_par(4); v = isca_par_ncread(fnc,vpar);

end