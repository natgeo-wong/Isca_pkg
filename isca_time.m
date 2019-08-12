function tstep = isca_time (name)



[ ~,name,~ ] = fileparts(name); fpart = strsplit(name,'_');
tstep = fpart{2};

end