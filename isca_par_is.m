function tf = isca_par_is (par,str)



tf = any(strcmp(str,strsplit(par.name,'_')));

end