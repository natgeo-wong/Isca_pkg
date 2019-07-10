function lvl = isca_pre2lvl (par,pre_all,pre)



if ~isca_par_is(par,'sfc')
    
    if nargin == 2
        pre = [ 250 300 500 700 850 900 ];
    end
    
    if strcmp(pre,'all'), lvl = 1 : numel(pre_all);
    else, [ ~,lvl ] = min(abs(pre_all-pre));
    end
    
else
    
    disp('Parameter is a surface variable.  Setting lvl to 0'); lvl = 0;

end