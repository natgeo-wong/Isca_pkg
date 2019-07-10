function psi = isca_psi_int(wind,pre,lat)



Re = 6371 * 1000; g = 9.81; lat = reshape(lat,1,[]); pre = pre * 100;

dim = size(wind); nt = dim(3); psi = zeros(dim);
for ii = 1 : nt, psi(:,:,ii,:) = cumtrapz(pre,wind(:,:,ii,:),4); end

psi = 2 * pi * Re .* cosd(lat) ./ g .* psi;

end