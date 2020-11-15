
% Fetches the found class out the evalfis output
% Param1: The output of the evalfis call
% Returns a vector of the classes
function classes = get_classes(y, t)
  result = [];
  for i = 1:rows(y)
    [val, a] = max(y(i,:));
    result(i) = a-1;
  end
  classes = result;
endfunction
