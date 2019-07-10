function isca_map_contourf(map,grd,cdata)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DATA HANDLING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mlon = grd.mlon; mlat = grd.mlat;
cvec = cdata.vec; cmap = cdata.map; clim = cdata.lim;

m_proj('robinson','lon',[0 360]);
m_contourf(mlon,mlat,map,cvec,'linestyle','none');
m_grid('tickdir','out','linewi',2,...
    'xtick',60:60:300,'ytick',-60:30:60);

colormap(gca,cmap); caxis(clim); colorbar;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end