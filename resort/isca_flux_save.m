function isca_flux_save (f,yr,root)



cd(root.out); load('isca_info.mat','pre');
par = isca_par(19); lvl = isca_pre2lvl(par,pre); nlvl = numel(lvl);

for i = 1 : nlvl, n = lvl(i);
    
    par = isca_par(19); isca_par_ncsave_pre(f.uv(:,:,:,i),root,par,yr,n);
    par = isca_par(20); isca_par_ncsave_pre(f.uT(:,:,:,i),root,par,yr,n);
    par = isca_par(21); isca_par_ncsave_pre(f.vT(:,:,:,i),root,par,yr,n);
    par = isca_par(22); isca_par_ncsave_pre(f.uq(:,:,:,i),root,par,yr,n);
    par = isca_par(23); isca_par_ncsave_pre(f.vq(:,:,:,i),root,par,yr,n);

end

end