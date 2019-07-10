function eke = isca_calc_eke(u,v,s,p)



u = permute(u,[1 2 4 3]); v = permute(v,[1 2 4 3]); g = 9.81;

uavg = isca_tsavg(u); usqr = (u-uavg).^2; usqr = isca_tsavg(usqr);
vavg = isca_tsavg(v); vsqr = (v-vavg).^2; vsqr = isca_tsavg(vsqr);
eke  = usqr + vsqr;   eke  = eke(:,:,:,11:end-10);
eke  = permute(eke,[1 2 4 3]);

s = reshape(s,1,1,1,[]); eke = eke .* s; eke = sum(eke,4) * p / (2*g);

end