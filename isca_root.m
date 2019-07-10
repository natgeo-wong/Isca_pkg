function root = isca_root

%                               fms_root
%              gets FMS directories for current experiment
%                         Nathanael Wong Zhixin
%
% root.home    | stores the initialised scripts
% root.scratch | is where the model is run and fms_tmp and fms_output are
%                stored
% root.esm     | is where the final outputs from fms_output are extracted
%                and stored

parts = strsplit(pwd,'/');
prj_name = parts{end-3}; root.prj = prj_name;
exp_name = parts{end-2}; root.exp = exp_name;
run_name = parts{end-1}; root.run = run_name;


if exist('/home/nwong002/','dir') == 7
      root.base = '/home/nwong002/Isca/Isca';
elseif exist('/Volumes/CliNat/','dir') == 7
      root.base = '/Volumes/CliNat/Isca/Isca';
else, root.base = '~/Documents/CliNat/Isca/Isca';
end

root.home = pwd;
root.raw  = [ root.base '_out/'  prj_name '/' exp_name '/' run_name ];
root.out  = [ root.base '_data/' prj_name '/' exp_name '/' run_name ];
root.ana  = [ root.base '_ana/'  prj_name '/' exp_name ];

if isca_spin(root)
    root.spin = [ root.base '_out/'  prj_name '/' exp_name '/spinup' ];
    root.ctrl = [ root.base '_out/'  prj_name '/' exp_name '/control' ];
end

end