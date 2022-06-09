function fileID = openStartupFile()

    user_startup_path = [userpath filesep 'startup.m'];
    
    if ~isfile(user_startup_path)
        write_mode = 'w';
    else
        write_mode = 'a';
    end
    
    fileID = fopen(user_startup_path, write_mode);
    
    if fileID == -1
        error('Failed to open startup file.');
    end

end