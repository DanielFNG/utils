function [n_files, files] = dirNoDots(directory)
% Return number of files & filenames from a directory. 

d = dir(directory);
d = d(~ismember({d.name}, {'.', '..'}));

n_files = length(d);
files = cell(1, n_files);
for i=1:n_files
    files{i} = [directory filesep d(i).name];
end