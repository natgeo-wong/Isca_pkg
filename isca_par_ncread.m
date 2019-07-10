function data = isca_par_ncread (fnc,par)



data = ncread(fnc,par.isca); ndim = numel(size(data));

if ndim == 4, data = permute(data,[1 2 4 3]); end

end