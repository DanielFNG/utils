function createDirectories(dir_struct)
% Create directories given a stucture holding directory paths.
% 
% Input is a structure formed as so:
%   dir_struct.dir1 = 'apple'
%   dir_struct.dir2 = 'banana'
% This function would then create the directories 'apple' and 'banana'.

dirs = fieldnames(dir_struct);
for i=1:length(dirs)
    if ~exist(dir_struct.(dirs{i}), 'dir')
        mkdir(dir_struct.(dirs{i}));
    end
end

end