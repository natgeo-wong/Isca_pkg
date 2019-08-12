function [ yr,ss,mo ] = isca_compile_extract_ysm (fnc,par,root,spin,ii)



cur = isca_compile_ncread_ysm(fnc,par,ii,root); dim = size(cur);
root.cur = pwd;

try bef = isca_compile_ncread_ysm(fnc,par,ii-1,root); bef = bef(:,:,12);
catch
    if spin && ~strcmp(root.run,'spinup')
          root.var = strrep(root.var,root.run,'spinup'); cd(root.var);
          fnc = dir('*.nc'); lnc = length(fnc); cd(root.cur);
          bef = isca_compile_ncread_ysm(fnc,par,lnc,root);
    else, bef = ones(dim(1:end-1)) * NaN;
    end
end

data = cat(3,bef,cur);

yrdata = data(:,:,2:13); yr = mean(yrdata,3,'omitnan');

ssdata = data(:,:,1:12); ssdata = reshape(ssdata,dim(1),dim(2),3,4);
mdata = mean(ssdata,3,'omitnan'); mdata = reshape(mdata,dim(1),dim(2),4);
ss = mdata;

modata = data(:,:,2:13); mo = modata;

end