% Prints the evaluation criteria to the  console
% Param1: The name of the evaluated result
% Param2: Vector with the counts of the result
% Param3: vector with the evaluations of the  result
function print_eval(name, error_rate, vcounts, veval)
  disp(["[", name, "]"]);
  disp([name, "-", "Total number of patterns: ", mat2str(error_rate)]);
  disp([name, "-", "Error rate: ", mat2str(sum(vcounts))]);
  disp([name, "-", "tp: ", mat2str(vcounts(1))]);
  disp([name, "-", "tn: ", mat2str(vcounts(2))]);
  disp([name, "-", "fp: ", mat2str(vcounts(3))]);
  disp([name, "-", "fn: ", mat2str(vcounts(4))]);
  disp([name, "-", "accuracy: ", mat2str(veval(1))]);
  disp([name, "-", "precision: ", mat2str(veval(2))]);
  disp([name, "-", "recall: ", mat2str(veval(3))]);
  disp([name, "-", "f_measure: ", mat2str(veval(4))]);
  disp([name, "-", "sensitivity: ", mat2str(veval(5))]);
  disp([name, "-", "specificity: ", mat2str(veval(6))]);
endfunction
