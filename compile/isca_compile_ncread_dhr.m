function data = isca_compile_ncread_dhr(fnc,par,ii,root)



data = isca_compile_ncread(fnc,par,ii,root); dim = size(data);
data = reshape(data,dim(1),dim(2),[],30);
data = reshape(mean(data,4,'omitnan'),dim(1:2),[]);

end