function psi = isca_calc_psi (u,v,lat,pre)



h = sqrt(u.^2 + v.^2);

psi.u = isca_psi_int(u,pre,lat);
psi.v = isca_psi_int(v,pre,lat);
psi.h = isca_psi_int(h,pre,lat);

end