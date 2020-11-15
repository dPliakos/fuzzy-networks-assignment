% Calculates the model's evaluatino criteria
% Returns a vector with [accuracy pressicion  recall f_measure sensitivity specificity]
function eval_criteria = evaluate(tp, tn, fp, fn)
  accuracy = (tp + tn) / tp + tn + fp + fn;

  if (tp + fp) > 0,
    precision = tp / (tp + fp);
  else
    precision = 0;
  endif

  if (tp + fn) > 0,
    recall = tp / (tp + fn);
  else
    recall = 0;
  endif

  if (precision + recall) > 0,
    f_measure = (precision * recall) / ((precision + recall) / 2);
  else
    f_measure = 0;
  endif

  if tp + fn > 0,
    sensitivity = tp / (tp + fn);
  else
    sensitivity = 0;
  endif

  if tn + fp > 0,
    specificity = tn / (tn + fp);
  else
    specificity = 0;
  endif

  eval_criteria = [accuracy precision recall f_measure sensitivity specificity];
endfunction
