function data_file = readAnalogFromC3D(filename)

    % Scaling parameters - automatic scaling as appropriate.
    offset = 0;
    factor = 1;
    by_scale = '0';
    use_scale = '0'; % automatic scaling?
    
    % Analog channel details.
    n_channels = 12;
    start_channel = 12;
    label_info = 23;

    % Create a connection to the c3dserver client.
    client = c3dserver;
    
    % Open the c3d file.
    failure = client.Open(filename, 3);
    if failure
        error('Failed to open c3d file.');
    end
    
    % Obtain frame information. 
    start_video_frame = client.GetVideoFrame(0);
    end_video_frame = client.GetVideoFrame(1);
    frame_ratio = client.GetAnalogVideoRatio;
    n_frames = (end_video_frame - start_video_frame + 1)*frame_ratio;
    
    % Construct & read data array. 
    value_array = zeros(n_frames, n_channels);
    for channel = 1:n_channels
        channel_idx = start_channel + channel - 1;
        video_frame = start_video_frame;
        sub_frame = 1;
        for frame = 1:n_frames
            value_array(frame, channel) = client.GetAnalogData(channel_idx, ...
                video_frame, sub_frame, by_scale, offset, factor, use_scale);
            if sub_frame == frame_ratio
                sub_frame = 1;
                video_frame = video_frame + 1;
            else
                sub_frame = sub_frame + 1;
            end
        end
    end
    
    % Construct time array.
    video_frame_rate = client.GetVideoFrameRate;
    frequency = video_frame_rate*frame_ratio;
    interval = 1/frequency;
    end_time = ((n_frames - 1)*interval);
    time_array = linspace(0, end_time, n_frames)';
    
    % Construct labels.
    labels = cell(1, n_channels + 1);
    labels{1} = 'Time';
    for i=1:n_channels
        labels{i + 1} = ...
            client.GetParameterValue(label_info, start_channel + i - 1);
    end
    
    % Create data object.
    data_array = [time_array, value_array];
    data_file = TXTData(data_array, {}, labels);
end