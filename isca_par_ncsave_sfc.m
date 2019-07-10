function isca_par_ncsave_sfc (data,root,par,yr)



iout = root.out; cd(iout); load('isca_info.mat','lon','lat');
pname = par.name; yr = num2str(yr,'%02d');

pdir = [ iout '/' pname ];         mkfol(pdir);
pnc  = [ pname '-year' yr '.nc' ]; rmfile(pnc);

dim = size(data);
nccreate(pnc,pname,...
    'Dimensions',{'lon',dim(1),'lat',dim(2),'t',dim(3)});
nccreate(pnc,'lon','Dimensions',{'nlon',dim(1)});
nccreate(pnc,'lat','Dimensions',{'nlat',dim(2)});


ncwrite(pnc,pname,data);
ncwrite(pnc,'lon',lon); ncwrite(pnc,'lat',lat);


movefile(pnc,pdir);

end