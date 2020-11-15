file = './data/data_banknote_authentication.txt';
addpath('./functions');

% splits the data acording to their class
function result = split_data(data, target_index)
  class0 = [];
  class1 = [];

  for i = 1:rows(data)
    if data(i,5) == 0,
      class0 = [class0 data(i, target_index)];
    else
      class1 = [class1 data(i, target_index)];
    endif
  end

  result = struct("zero", class0, "one", class1);
endfunction

% Read the data
raw_data = csvread(file);
shuffled = shuffle_dataset(raw_data);
data = shuffled(1:int32(rows(shuffled) * 0.7),:);

% read variables
variance = data(:,1);
skewnes = data(:,2);
curtosis = data(:,3);
entropy = data(:,4);
authenticity = data(:,5);

clf;
close all;
variance_splited = split_data(data, 1);
skewnes_splited = split_data(data, 2);
curtosis_splited = split_data(data, 3);
entropy_splited = split_data(data, 4);

fig_variance = compare_histograms('Variance', variance_splited.zero, variance_splited.one, 300);
fig_skewness = compare_histograms('Skewness', skewnes_splited.zero, skewnes_splited.one, 300);
fig_curtosis = compare_histograms('Curtosis', curtosis_splited.zero, curtosis_splited.one, 300);
fig_entropy = compare_histograms('Image entropy', entropy_splited.zero, entropy_splited.one, 300);

uiwait(fig_variance);
uiwait(fig_skewness);
uiwait(fig_curtosis);
uiwait(fig_entropy);
