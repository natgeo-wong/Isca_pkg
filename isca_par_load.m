function str = isca_par_load



%#ok<*AGROW>
info = textread('isca_par.txt','%s','commentstyle','shell','delimiter',',');
info = reshape(info,5,[]); info(1,:) = []; info = info';

for ii = 1 : length(info)
    
    str(ii).name = info{ii,1}; str(ii).isca = info{ii,2};
    str(ii).full = info{ii,3}; str(ii).unit = info{ii,4};
    
end

end