function isca_compile_ncsave (data,par,root,lvl,tstp)



if strcmp(tstp,'daily') || strcmp(tstp,'monthly')
      isca_compile_ncsave_ysm(data,par,root,lvl)
else, isca_compile_ncsave_dhr(data,par,root,lvl)
end

end