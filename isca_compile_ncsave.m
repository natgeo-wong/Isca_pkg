function isca_compile_ncsave (data,par,root,lvl)



l = length(data); sig = num2str(lvl,'%02d');

if ~isca_par_is(par,'sfc')
    fnc = [ root.run '-' par.name '-sig' sig '.nc' ];
    fol = [ root.ana '/' par.name '/' par.name '-sig' sig ];
else
    fnc = [ root.run '-' par.name '.nc' ];
    fol = [ root.ana '/' par.name ];
end

mkfol(fol); rmfile(fnc);

mdim = size(data(1).yr);

yrd = zeros([mdim l]); ssd = zeros([mdim 4 l]); mod = zeros([mdim 12 l]);

for ii = 1 : l
    yrd(:,:,ii)   = data(ii).yr;
    ssd(:,:,:,ii) = data(ii).ss;
    mod(:,:,:,ii) = data(ii).mo;
end

nccreate(fnc,'yr','Dimensions',{'lon',mdim(1),'lat',mdim(2),'t',l});
nccreate(fnc,'ss','Dimensions',{'lon',mdim(1),'lat',mdim(2),'s',4,'t',l});
nccreate(fnc,'mo','Dimensions',{'lon',mdim(1),'lat',mdim(2),'m',12,'t',l});
if ~isca_par_is(par,'sfc'), nccreate(fnc,'lvl','Dimensions',{'sig',1}); end

ncwrite(fnc,'yr',yrd); ncwrite(fnc,'ss',ssd); ncwrite(fnc,'mo',mod);
if ~isca_par_is(par,'sfc'); ncwrite(fnc,'lvl',lvl); end

movefile(fnc,fol);

end