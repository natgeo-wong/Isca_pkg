function tcw = isca_calc_tcw (shum,pre,psfc)



shum(:,:,:,end+1) = shum(:,:,:,end); rv = shum ./ (1 - shum);
pre(end+1) = psfc; pre = pre * 100; tcw = trapz(pre,rv,4) ./ (9.81*1000);

end