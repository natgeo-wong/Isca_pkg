function isca_compile_ncsave_dhr (data,par,root,lvl)



l = length(data); sig = num2str(lvl,'%02d');

if ~isca_par_is(par,'sfc')
    fnc = [ root.run '-' par.name '-sig' sig '.nc' ];
    fol = [ root.ana '/' par.name '/' par.name '-sig' sig ];
else
    fnc = [ root.run '-' par.name '.nc' ];
    fol = [ root.ana '/' par.name ];
end

mkfol(fol); rmfile(fnc);

mdim = size(data(1).hr); mod = zeros(mdim(1:2),l); hrd = zeros(mdim,l);

for ii = 1 : l
    mod(:,:,ii)   = data(ii).mo;
    hrd(:,:,:,ii) = data(ii).hr;
end

ncdim = {'lon',mdim(1),'lat',mdim(2)};
nccreate(fnc,'mo','Dimensions',{ncdim,'mo',l});
nccreate(fnc,'hr','Dimensions',{ncdim,'hr',mdim(3),'mo',l});
if ~isca_par_is(par,'sfc'), nccreate(fnc,'lvl','Dimensions',{'sig',1}); end

ncwrite(fnc,'mo',mod); ncwrite(fnc,'hr',hrd);
if ~isca_par_is(par,'sfc'); ncwrite(fnc,'lvl',lvl); end

movefile(fnc,fol);

end