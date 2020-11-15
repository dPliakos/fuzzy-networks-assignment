
% Fetches the found class out the evalfis output
% Param1: The output of the evalfis call
% Returns a vector of the classes
function result = get_output(vresult)
  output = [];
  for i = 1:rows(vresult)
    [val, a] = max(vresult(i,:));
    output(i) = a-1;
  end
  result = output;
endfunction
