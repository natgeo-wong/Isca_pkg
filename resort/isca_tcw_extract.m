function [ shum,psfc ] = isca_tcw_extract (yr,root)



[ dfol,fnc ] = isca_dinfo(root.raw); cd([ root.raw '/' dfol(yr).name ]);

spar = isca_par(12); shum = isca_par_ncread(fnc,spar);
phlf = ncread(fnc,'phalf'); psfc = phlf(end);

end