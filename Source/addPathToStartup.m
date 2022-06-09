function addPathToStartup(path)

    fileID = openStartupFile();
    
    fprintf(fileID, '\n%s', ['addpath(''' path ''');']);
    
    fclose(fileID);

end