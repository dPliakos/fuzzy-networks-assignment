function error_rate = get_eval_error(y, t)
  result = [];
  for i = 1:rows(y)
    [val, a] = max(y(i,:));
    result(i) = (val - t(i))^2;
  end
  error_rate = sum(result);
endfunction
