function flux = isca_flux_prod(p1,p2)



p1 = permute(p1,[1 2 4 3]); p2 = permute(p2,[1 2 4 3]);

p1avg = isca_tsavg(p1);   p1sqr = (p1-p1avg).^2;
p2avg = isca_tsavg(p2);   p2sqr = (p2-p2avg).^2;
flux  = p1sqr .* p2sqr;   flux  = flux(:,:,:,11:end-10);
flux  = isca_tsavg(flux); flux  = permute(flux,[1 2 4 3]);

end