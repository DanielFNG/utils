function plotShadedSDevs(matrices, labels, xtitle, ytitle, x)

    figure;
    hold on;
    for i = 1:length(matrices)
        matrix = matrices{i};
        means = mean(matrix);
        sdevs = std(matrix);
        upper = means + sdevs;
        lower = means - sdevs;
        interior = [upper, fliplr(lower)];

        if nargin < 5
            x = 0:length(means) - 1;
        end
        x_interior = [x, fliplr(x)];
        
        t = plot(x, means, 'LineWidth', 2.0, 'DisplayName', labels{i});
        fill(x_interior, interior, t.Color, 'FaceAlpha', 0.2, ...
            'EdgeColor', t.Color, 'HandleVisibility', 'Off');
    end
    
    xlabel(xtitle);
    ylabel(ytitle);
    set(gca, 'FontSize', 15);
    legend();
end