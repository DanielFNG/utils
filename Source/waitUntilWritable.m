function waitUntilWritable(file, time)
% Check if a file exists & is writable. Pause for a given time if not. Repeat. 

while ~(exist(file, 'file') == 2)
    fprintf('Waiting for file to exist.\n');
    pause(time);
end

[~, values] = fileattrib(file);

while ~values.UserWrite
    fprintf('Waiting for file to be writable.\n');
    pause(time);
end

end