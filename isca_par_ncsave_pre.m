function isca_par_ncsave_pre (data,root,par,yr,lvl)



iout = root.out; cd(iout); load('isca_info.mat','lon','lat','pre');
pname = par.name; yr = num2str(yr,'%02d'); slvl = num2str(lvl,'%02d');

pdir = [ iout '/' pname '/' pname '-sig' slvl ]; mkfol(pdir);
pnc  = [ pname '-sig' slvl '-year' yr '.nc' ];   rmfile(pnc);

dim = size(data);
nccreate(pnc,pname,...
    'Dimensions',{'lon',dim(1),'lat',dim(2),'t',dim(3)});
nccreate(pnc,'lon','Dimensions',{'nlon',dim(1)});
nccreate(pnc,'lat','Dimensions',{'nlat',dim(2)});
nccreate(pnc,'pre','Dimensions',{'lvl',1});

ncwrite(pnc,pname,data);
ncwrite(pnc,'lon',lon); ncwrite(pnc,'lat',lat);
ncwrite(pnc,'pre',pre(lvl));

movefile(pnc,pdir);

end