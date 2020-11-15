% Shuffles the order of the a dataset
% Param1: The  data to shuffle
% Returns The matrix of shuffled data
% Source: https://octave.1599824.n4.nabble.com/Shuffling-elements-in-a-dataset-td1608859.html
% Author: Marvin Vis
function result = shuffle_dataset(x)
  n = rand(length(x),1);
  [garbage index] = sort(n);
  result = x(index,:);
endfunction
