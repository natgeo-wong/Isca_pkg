function data = isca_compile_ncread(fnc,par,ii,root)



data = ncread([ root.var '/' fnc(ii).name ],par.name); dim = size(data);
data = reshape(data,dim(1),dim(2),[],12);
data = reshape(mean(data,3,'omitnan'),[dim(1:2) 12]);

end