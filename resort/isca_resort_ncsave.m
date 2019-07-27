function isca_resort_ncsave (par,ncvar,yr,root,data)



dim = ncvar.dim; pre = ncvar.pre; mkfol(root.out);
if isca_par_is(par,'sfc'), lvl = 0; else, lvl = isca_pre2lvl(par,pre); end

for ii = 1 : length(lvl)
    
    if isca_par_is(par,'sfc'), dataii = data;
        par.lvl = par.name;
        pardir  = [ root.out '/' par.name ];
    else, dataii = reshape(data(:,:,ii,:),dim(1),dim(2),dim(3));
        par.lvl = [ par.name '-sig' num2str(lvl(ii),'%02d') ];
        pardir  = [ root.out '/' par.name '/' par.lvl ];
    end
    
    fparnc  = [ par.lvl '-year' num2str(yr,'%02d') '.nc' ];
    
    mkfol(pardir); rmfile(fparnc);
    
    nccreate(fparnc,par.name,...
            'Dimensions',{'lon',dim(1),'lat',dim(2),'t',dim(3)});
    nccreate(fparnc,'lon','Dimensions',{'nlon',dim(1)});
    nccreate(fparnc,'lat','Dimensions',{'nlat',dim(2)});
    if ~isca_par_is(par,'sfc')
        nccreate(fparnc,'pre','Dimensions',{'lvl',1});
    end
    
    ncwrite(fparnc,par.name,dataii);
    ncwrite(fparnc,'lon',ncvar.lon); ncwrite(fparnc,'lat',ncvar.lat);
    if ~isca_par_is(par,'sfc')
        ncwrite(fparnc,'pre',ncvar.pre(lvl(ii)));
    end
    
    movefile(fparnc,pardir);
    
end

end