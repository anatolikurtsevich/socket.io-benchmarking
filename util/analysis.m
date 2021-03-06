% Does graphing and analysis on data generated by the client tester. 

data = importdata('data.log', ',', 0);

% Sort by concurrency level, then messages per second. It comes out a
% little wonky from Java beacuse it's stored as a map.
data = sortrows(data, [1, 2]);

% now we want to make a graph that charts
concurrencyLevels = [25, 50, 75, 100, 200, 300, 400, 500, 750, 1000];

% color setup
colors = [26, 47, 125;
27, 60, 126;
27, 73, 127;
28, 92, 129;
29, 111, 130;
31, 125, 132;
32, 138, 133;
34, 151, 135;
35, 164, 136;
36, 174, 137;
38, 186, 138];
colors = colors/255;


i=1;
for concurrency = concurrencyLevels
    % get all the data for that concurrency level
    concurrency
    results = data(find(data(:, 1)==concurrency), :);
    
    
    % there are a few different graph options:
    
    h = semilogy(results(:, 2), results(:, 5));    
    % h = semilogy(results(:, 2).*results(:, 1), results(:, 5));
    
    % h = plot(results(:, 2), results(:, 5));    
    % h = plot(results(:, 2).*results(:, 1), results(:, 5));

    set(h, 'LineWidth', 2.0);
    set(h, 'Color', colors(i, :));
    i=i+1;
    hold on
end

h = xlabel('messages sent per second');
set(h, 'FontSize', 14);
h = ylabel('mean roundtrip time (ms)');
set(h, 'FontSize', 14);
set(gca, 'FontSize', 14);
set(gcf, 'Color', [1,1,1]);
set(gcf, 'OuterPosition', [500, 1000, 900, 450]);

legend(num2str(concurrencyLevels'));