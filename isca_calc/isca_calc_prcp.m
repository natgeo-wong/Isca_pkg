function prcp = isca_calc_prcp (prcp)



prcp.rain = prcp.rcnd + prcp.rcnv;
prcp.snow = prcp.tot  - prcp.rain;

end