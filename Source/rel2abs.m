function varargout = rel2abs(varargin)
% Convert paths to absolute format.

for i=1:length(varargin)
    if ~java.io.File(varargin{i}).isAbsolute
        varargout{i} = fullfile(pwd, varargin{i});
    else
        varargout{i} = varargin{i};
    end
end
    
end

