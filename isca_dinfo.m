function [ dinfo,name ] = isca_dinfo (fdir)



cd(fdir); dinfo = dir();
dinfo(ismember({dinfo.name},{'.','..','restarts','isca_run'})) = [];
dinfo = dinfo([dinfo.isdir]);

cd(dinfo(1).name); fnc = dir('*.nc'); name = fnc(1).name;

end