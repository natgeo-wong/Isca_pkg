function isca_compile (parvec,root)

%                              isca_compile
%    Script meant to compile output from isca models into year and month
%                          Nathanael Wong Zhixin

fprintf('COMPILING ISCA OUTPUT DATA ...\n');
if nargin == 1, root = isca_root; end; spin = isca_spin(root);
load([root.out '/isca_info.mat'],'tstp');

for ii = parvec, par = isca_par(ii);
    
    if ~isca_par_is(par,'sfc')
          load([root.out '/isca_info.mat'],'pre');
          lvl = isca_pre2lvl(par,pre);
    else, lvl = 0;
    end
    
    for jj = lvl, isca = [];
        
        if isca_par_is(par,'sfc'), root.var = [ root.out '/' par.name ];
        else, par.lvl = [ par.name '-sig' num2str(jj,'%02d') ];
            root.var  = [ root.out '/' par.name '/' par.lvl ];
        end
        cd(root.var); fnc = dir('*.nc'); cd(root.out); l = length(fnc);
        tic; isca = isca_compile_extract(fnc,par,root,spin,tstp); t(1) = toc;
        
        cd(root.out);
        
        tic; isca_compile_ncsave (isca,par,root,jj); t(2) = toc;
        
        fprintf([ 'COMPILED DATA FOR PARAMETER: %s, LEVEL: %d | ' ...
                  'TOTAL ELAPSED TIME: %.4f sec\n' ...
                  '    EXTRACTION: %.4f sec\n' ...
                  '    SAVE NETCDF: %.4f sec\n\n' ], ...
                  par.full,jj,sum(t),t);
        
    end
    
end