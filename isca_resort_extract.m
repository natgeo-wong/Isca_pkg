function data = isca_resort_extract(par,ncvar)



data = ncread('atmos_daily.nc',par.isca); pre = ncvar.pre;

if ~isca_par_is(par,'sfc')
    lvl = isca_pre2lvl(par,pre); data = data(:,:,lvl,:);
end

if isca_par_is(par,'p'),    data = data/100;     end
if isca_par_is(par,'t'),    data = data - 273.15; end
if isca_par_is(par,'prcp'), data = data*24*60*60; end
if isca_par_is(par,'rcnd'), data = data*24*60*60; end
if isca_par_is(par,'rcnv'), data = data*24*60*60; end

end