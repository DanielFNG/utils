function scaled_vector = stretchVector(input_vector, desired_size,stretch_direction)
% Stretch/compress a vector to a specified size using linear interpolation.
%
% Output is a row vector.

if ~isvector(input_vector)
    if length(size(input_vector))>2
        error('Input must be vector or 2D matrix.');
    end
    len = size(input_vector,stretch_direction);
    x = 1:len;
    z = 1:(len - 1)/(desired_size - 1):len;
    if stretch_direction==1
        for i=1:size(input_vector,2)
            scaled_vector(:,i) = interp1(x, input_vector(:,i), z);
        end
    elseif stretch_direction==2
        for i=1:size(input_vector,1)
            scaled_vector(i,:) = interp1(x, input_vector(i,:), z);
        end
    end
else
    len = length(input_vector);
    x = 1:len;
    z = 1:(len - 1)/(desired_size - 1):len;
    scaled_vector = interp1(x, input_vector, z);
end


end
