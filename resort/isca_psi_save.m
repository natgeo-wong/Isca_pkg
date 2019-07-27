function isca_psi_save (psi,yr,root)



cd(root.out); load('isca_info.mat','pre');
par = isca_par(24); lvl = isca_pre2lvl(par,pre); nlvl = numel(lvl);

for i = 1 : nlvl, n = lvl(i);
    
    par = isca_par(24); isca_par_ncsave_pre(psi.u(:,:,:,i),root,par,yr,n);
    par = isca_par(25); isca_par_ncsave_pre(psi.v(:,:,:,i),root,par,yr,n);
    par = isca_par(26); isca_par_ncsave_pre(psi.h(:,:,:,i),root,par,yr,n);

end

end