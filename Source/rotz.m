function rot = rotz(angle)
% Return the rotation matrix for a rotation of angle about the z axis.

    angle = deg2rad(angle);
    rot = [cos(angle), -sin(angle), 0; ...
        sin(angle), cos(angle), 0; ...
        0, 0, 1];

end