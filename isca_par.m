function par = isca_par (ii)



str = isca_par_load; npar = length(str);

if nargin == 0, isca_par_disp(str);
    disp('Please choose the desired variable:');
    ii = input('Parameter: ');
    while ~any(ii == 1:npar)
        disp('Error!  Please choose a valid parameter option.');
        ii = input('Parameter: ');
        fprintf('\n');
    end
end

par.name = str(ii).name; par.isca = str(ii).isca; par.full = str(ii).full;
par.unit = str(ii).unit;

end