% Compares a set of targets to the given output
% param1: A vector with the real targets
% param2: A vector with the calculated targets
% Rturns a vector with [tp tn fp fn]
function counted_values = count_results(real_t, calculated_t)
  tn = 0;
  tp = 0;
  fn = 0;
  fp = 0;

  for i = 1:columns(calculated_t)
    if calculated_t(i) == real_t(i) && real_t(i) == 1,
      tp = tp + 1;
    elseif calculated_t(i) == real_t(i) && real_t(i) == 0,
      tn = tn + 1;
    elseif calculated_t(i) != real_t(i) && real_t(i) == 1,
      fp = fp + 1;
    elseif calculated_t(i) != real_t(i) && real_t(i) == 0,
      fn = fn + 1;
    endif
  end

  counted_values = [tp tn fp fn];
endfunction
