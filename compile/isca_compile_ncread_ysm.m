function data = isca_compile_ncread_ysm(fnc,par,ii,root)



data = isca_compile_ncread(fnc,par,ii,root); dim = size(data);
data = reshape(data,dim(1),dim(2),[],12);
data = reshape(mean(data,3,'omitnan'),[dim(1:2) 12]);

end