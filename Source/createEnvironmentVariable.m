function createEnvironmentVariable(name, value)
% Modify startup.m file to set an environment variable for future sessions.

    fileID = openStartupFile();
    
    fprintf(fileID, '\n%s', ['setenv(''' name ''', ''' value ''');']);
    
    fclose(fileID);

end
