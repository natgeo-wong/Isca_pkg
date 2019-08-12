function isca_resort (parvec,root)

%                              isca_resort
%            Script meant to analyse output from Isca models
%                         Nathanael Wong Zhixin

fprintf('RESORTING VARIABLES FROM ISCA OUTPUT DATA ...\n');
if nargin ~= 1, root = isca_root; end
[ dinfo,name ] = isca_dinfo(root.raw); ndir = length(dinfo);

%% Find Size of Data Matrices

info = ncinfo(name);           ncvar.info = info;
nlon = info.Variables(1).Size; ncvar.lon  = ncread(name,'lon');
nlat = info.Variables(3).Size; ncvar.lat  = ncread(name,'lat');
nstp = info.Variables(5).Size; ncvar.pre  = ncread(name,'pfull');
dim  = [nlon nlat nstp];       ncvar.dim  = dim;
tstp = isca_time;

%% Begin Resort
for yr = 1 : ndir, cd([ root.raw '/' dinfo(yr).name]);
    
    for jj = parvec, par = isca_par(jj); t = zeros(1,2);
        
        tic; var = isca_resort_extract(par,ncvar,tstp);        t(1) = toc;
        tic;       isca_resort_ncsave (par,ncvar,yr,root,var); t(2) = toc;
        
        fprintf ([ 'RESORTED DATA FOR VARIABLE: %s, YEAR: %d | ' ...
                   'TOTAL ELAPSED TIME: %.4f sec\n' ...
                   '    EXTRACTION: %.4f sec\n' ...
                   '    SAVE NETCDF: %.4f sec\n\n' ], ...
                   par.full,yr,sum(t),t);
        
    end
    
end

lon = ncvar.lon; lat = ncvar.lat; pre = ncvar.pre;
save([root.out '/isca_info.mat'],'lon','lat','pre','tstp');

cd(root.home);

end