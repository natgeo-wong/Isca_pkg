function data = isca_compile_ncread(fnc,par,ii,root)



data = ncread([ root.var '/' fnc(ii).name ],par.name);

end