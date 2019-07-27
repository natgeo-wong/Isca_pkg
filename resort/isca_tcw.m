function isca_tcw (root)

%                              isca_resort
%            Script meant to analyse output from Isca models
%                         Nathanael Wong Zhixin

fprintf('CALCULATING TOTAL COLUMN WATER ...\n');
if nargin ~= 1, root = isca_root; end
[ dinfo,~ ] = isca_dinfo(root.raw); ndir = length(dinfo);

cd(root.out); load('isca_info.mat','pre');

for yr = 1 : ndir
    
    tic; [ shum,psfc ] = isca_tcw_extract(yr,root);       t(1) = toc;
    tic;      tcw      = isca_calc_tcw(shum,pre,psfc); t(2) = toc;
    tic;                 isca_tcw_save(tcw,yr,root);   t(3) = toc;
    
    fprintf([ 'CALCULATED TOTAL COLUMN WATER FOR YEAR: %d | ' ...
              'TOTAL ELAPSED TIME: %.4f sec\n' ...
              '    EXTRACTION: %.4f sec\n' ...
              '    CALCULATION: %.4f sec\n' ...
              '    SAVE NETCDF: %.4f sec\n\n' ], ...
              yr,sum(t),t);
    
end

cd(root.home);

end