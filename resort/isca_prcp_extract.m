function prcp = isca_prcp_extract (yr,root)



[ dfol,fnc ] = isca_dinfo(root.raw); cd([ root.raw '/' dfol(yr).name ]);

rtpar = isca_par(9);  prcp.tot  = isca_par_ncread(fnc,rtpar) * 24 * 3600;
rlpar = isca_par(10); prcp.rcnd = isca_par_ncread(fnc,rlpar) * 24 * 3600;
rcpar = isca_par(11); prcp.rcnv = isca_par_ncread(fnc,rcpar) * 24 * 3600;

end