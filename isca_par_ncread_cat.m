function data = isca_par_ncread_cat (par,yr,root,spin)



[ dfol,fnc ] = isca_dinfo(root.raw); cd([ root.raw '/' dfol(yr).name ]);

dn = isca_par_ncread(fnc,par);

try cd([ root.raw '/' dfol(yr-1).name ]);
    db = isca_par_ncread(fnc,par);
catch
    if spin && ~strcmp(root.run,'spinup'), dspn = isca_dinfo(root.spin);
          cd([ root.spin '/' dspn(end).name ]);
          db = isca_par_ncread(fnc,par);
    else, db = dn * NaN;
    end
end

try cd([ root.raw '/' dfol(yr+1).name ]);
    da = isca_par_ncread(fnc,par);
catch
    if spin && strcmp(root.run,'spinup'), dctl = isca_dinfo(root.ctrl);
          cd([ root.ctrl '/' dctl(1).name ]);
          da = isca_par_ncread(fnc,par);
    else, da = dn * NaN;
    end
end

db = db(:,:,end-9:end,:); da = da(:,:,1:10,:); data = cat(3,db,dn,da);

end