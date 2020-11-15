pkg load fuzzy-logic-toolkit
pkg load statistics
addpath('./functions');

file = './data/data_banknote_authentication.txt';
fis_file = './format.fis';

# Read data
data = shuffle_dataset(csvread(file));
x = data(:,1:4);
t = data(:,5);
fis = readfis(fis_file);


train_length = round(rows(x)*0.7) - 1;
test_length = rows(x) - train_length;
xtrain = x(1:train_length,:);
ttrain = t(1:train_length,:);

xtest = x(train_length+1:rows(x),:);
ttest = t(train_length+1:rows(x),:);

# gia kathe lanthasmeno apatelsma
max_epoch = 10;
max_error = 0.2;

params = [];
counts = [];
result = [];
errors = [];
for epoch = 1:max_epoch

  % Mock train
  for rule_index = 1:columns(fis.rule)
    fis.rule(rule_index).weight = rand();
  end
  params(epoch,:) = [fis.rule.weight];

  % Fuzzify
  y = evalfis(xtrain, fis);

  % defuz and get error
  errors(epoch) = get_eval_error(y, ttrain);

  if errors(epoch) < errors(epoch),
    break;
  endif;
end


[best_res best_index] = min(errors);

for i=1:columns(fis.rule)
  fis.rule(i).weight = params(best_index,i);
end

y = evalfis(xtest, fis);
y_all = evalfis(x, fis);

result = get_output(y);
result_all = get_output(y_all);

err = get_eval_error(y, ttest);
err_all = get_eval_error(y_all, t);

% Count the evaluation data for the test set
counts = count_results(ttest, result);
evaluation = evaluate(counts(1), counts(2), counts(3), counts(4));

% Count and calculate the evaluation data for the whole set
counts_all = count_results(t, result_all);
evaluation_all = evaluate(counts_all(1), counts_all(2), counts_all(3), counts_all(4));

print_eval("test", err, counts, evaluation);
print_eval("all", err_all, counts_all, evaluation_all);

disp(["params: ", mat2str(params)]);
