function data = isca_compile_extract (fnc,par,root,spin,tstp)



for kk = 1 : l
    if strcmp(tstp,'daily') || strcmp(tstp,'monthly')
        [ data(kk).yr,data(kk).ss,data(kk).mo ] = ...
            isca_compile_extract_ysm (fnc,par,root,spin,kk);
    else
        [ data(kk).mo,data(kk).hr ] = ...
            isca_compile_extract_dhr (fnc,par,root,kk);
    end
end

end