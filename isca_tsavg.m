function avg = isca_tsavg (data)



w = [ 0.0198 0.0659 0.1284 0.1833 0.2052 0.1833 0.1284 0.0659 0.0198 ];

dim = size(data); data = reshape(data,[],dim(end));
avg = tsmovavg(data,'w',w);                         % transpose and find moving average
avg = avg(:,[5:end 1:4]); avg = reshape(avg,dim);   % transpose back and reshape

end