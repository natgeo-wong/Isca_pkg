function isca_par_disp (parlist)



fprintf('The following variables are offered in Isca:\n');
for ii = 1 : length(parlist), fprintf('%d) %s\n',ii,parlist(ii).full); end
fprintf('\n');

end