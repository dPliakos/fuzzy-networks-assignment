% Create a plot which combines the histograms of tow
function fig = compare_histograms(var_name, class0, class1, nbins)
  fig = figure;
  hist(class0, nbins, 'FaceColor',[0,0.7,0.7]);
  hold on;
  hist(class1, nbins, 'FaceColor',[0.2,0.2,0.5]);

  legend([var_name, ' of class 0'], [var_name, ' of class 1']);
  title(["Distribution of ", var_name]);
  hold off;
endfunction
