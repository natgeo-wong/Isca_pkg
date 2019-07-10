function isca_prcp_save (prcp,yr,root)



par = isca_par(16); isca_par_ncsave_sfc(prcp.rain,root,par,yr);
par = isca_par(17); isca_par_ncsave_sfc(prcp.snow,root,par,yr);

end