function isca_eke (root)

%                              isca_resort
%            Script meant to analyse output from Isca models
%                         Nathanael Wong Zhixin

fprintf('CALCULATING STORM EDDY VARIABLES ...\n');
if nargin ~= 1, root = isca_root; end
[ dinfo,~ ] = isca_dinfo(root.raw); ndir = length(dinfo);
spin = isca_spin(root);

for yr = 1 : ndir
    
    tic; [ u,v,s,p ] = isca_eke_extract(yr,root,spin); t(1) = toc;
    tic; [   eke   ] = isca_calc_eke(u,v,s,p);         t(2) = toc;
    tic;               isca_eke_save(eke,yr,root);     t(3) = toc;
    
    fprintf([ 'CALCULATED STORM EDDY STATISTICS FOR YEAR: %d | ' ...
              'TOTAL ELAPSED TIME: %.4f sec\n' ...
              '    EXTRACTION: %.4f sec\n' ...
              '    CALCULATION: %.4f sec\n' ...
              '    SAVE NETCDF: %.4f sec\n\n' ], ...
              yr,sum(t),t);
    
end

cd(root.home);

end