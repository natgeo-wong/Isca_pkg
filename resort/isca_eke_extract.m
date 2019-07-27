function [ u,v,s,p ] = isca_eke_extract (yr,root,spin)



upar = isca_par(3); u = isca_par_ncread_cat(upar,yr,root,spin);
vpar = isca_par(4); v = isca_par_ncread_cat(vpar,yr,root,spin);

[ dfol,fnc ] = isca_dinfo(root.raw); cd([ root.raw '/' dfol(yr).name ]);
s = ncread(fnc,'bk');    s = s(2:end) - s(1:end-1);
p = ncread(fnc,'phalf'); p = p(end);

end