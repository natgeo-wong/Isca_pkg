function isca_prcp (root)

%                              isca_resort
%            Script meant to analyse output from Isca models
%                         Nathanael Wong Zhixin

fprintf('CALCULATING ADDITIONAL PRECIPITATION VARIABLES ...\n');
if nargin ~= 1, root = isca_root; end
[ dinfo,~ ] = isca_dinfo(root.raw); ndir = length(dinfo);

for yr = 1 : ndir
    
    tic; prcp = isca_prcp_extract(yr,root);      t(1) = toc;
    tic; prcp = isca_calc_prcp(prcp);         t(2) = toc;
    tic;        isca_prcp_save(prcp,yr,root); t(3) = toc;
    
    fprintf([ 'CALCULATED PRECIPITATION STATISTICS FOR YEAR: %d | ' ...
              'TOTAL ELAPSED TIME: %.4f sec\n' ...
              '    EXTRACTION: %.4f sec\n' ...
              '    CALCULATION: %.4f sec\n' ...
              '    SAVE NETCDF: %.4f sec\n\n' ], ...
              yr,sum(t),t);
    
end

cd(root.home);

end