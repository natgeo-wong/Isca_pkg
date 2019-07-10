function tf = isca_spin (root)



cdir = pwd; cd(root.raw); cd ..;
dinfo = dir(); dinfo(ismember({dinfo.name},{'.','..'})) = [];
dinfo = dinfo([dinfo.isdir]);
cd(cdir); dname = extractfield(dinfo,'name');
if any(strcmp(dname,'spinup')), tf = 1; else, tf = 0; end

end