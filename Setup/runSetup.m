function runSetup()
% Sets the 'OPENSIM_MATLAB_HOME' environment variable and adds the 
% required source code directories to the Matlab path.

% Root dir - main directory
root_dir = fileparts(pwd);

% Modify the Matlab path to include the source folder.
path = genpath([root_dir filesep 'Source']);
addpath(path);
addPathToStartup(path);

end
