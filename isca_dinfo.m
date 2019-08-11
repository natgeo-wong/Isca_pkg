function [ fol,name ] = isca_dinfo (fdir)



cd(fdir); fol = dinfo('restarts','isca_run');
cd(fol(1).name); fnc = dir('*.nc'); name = fnc(1).name;

end