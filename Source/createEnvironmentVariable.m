function createEnvironmentVariable(name, value)
% Modify startup.m file to set an environment variable for future sessions. 
%
% Basic steps are as follows:
%   1) Checks if startup.m file exists. 
%   2) If not, check if we have access to Matlab root.
%   3) If we do, create a new startup.m file here.
%   4) If we don't, prompt the user to run as administrator or manually add
%      the required lines to startup.m if preferred.
%   5) If startup.m does exist, append to it. Make the same prompt as above
%      if needed.


    startup_file = which('startup.m');
    if isempty(startup_file)
        [fileID,~] = fopen([matlabroot filesep 'startup.m'], 'w');
        if fileID == -1
            error(['Attempted to create startup.m file in matlabroot,'...
                ' but access was denied. Please run as administrator or'...
                ' manually add the desired environment variable to the '...
                'Matlab startup.m file.']);
        end
        fprintf(fileID, '%s', ['setenv(''' name ''', ''' value ''');']);
    else
        fileID = fopen(startup_file, 'a');
        if fileID == -1
            error(['Attempted to open existing startup.m file in ' ...
                'matlabroot, but access was denied. Please run as ' ...
                'administrator or manually add the desired environment'...
                ' variable to the Matlab startup.m file.']);
        end
        fprintf(fileID, '\n%s', ['setenv(''' name ''', ''' value ''');']);
    end
end