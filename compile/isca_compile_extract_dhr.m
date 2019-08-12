function [ mo,hr ] = isca_compile_extract_dhr (fnc,par,root,ii)



hr = isca_compile_ncread_dhr(fnc,par,ii,root); mo = mean(hr,3,'omitnan');

end