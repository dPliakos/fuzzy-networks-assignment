pkg load fuzzy-logic-toolkit
addpath("./functions") % Adds the functions in the namespace

file = './data/data_banknote_authentication.txt';
fis_file = './format.fis';


# Read data
data = csvread(file);
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
max_epoch = 1;

params = [];
counts = [];
result = [];
for epoch = 1:max_epoch
  if max_epoch > 1,
    disp(["Running epoch: ", mat2str(epoch)])
  endif
  for rule_index = 1:columns(fis.rule)
    fis.rule(rule_index).weight = rand(); % i([0 1]);
  end
  params(epoch,:) = [fis.rule.weight];

  y = evalfis(xtrain, fis);

  result = [];
  for i = 1:rows(y)
    [val, a] = max(y(i,:));
    result(i) = a-1;
  end

  count_true = 0;
  for i = 1:columns(result)
    if result(i) == ttrain(i),
      count_true = count_true + 1;
    endif
  end

  counts(epoch) = count_true;
end

[best_res best_index] = max(counts);

for i=1:columns(fis.rule)
  fis.rule(i).weight = params(best_index,i);
end

y = evalfis(xtest, fis);
y_all = evalfis(x, fis);

% Get the final result
result = get_output(y);
result_all = get_output(y_all);

% Count the evaluation data for the test set
counts = count_results(ttest, result);
evaluation = evaluate(counts(1), counts(2), counts(3), counts(4));

% Count and calculate the evaluation data for the whole set
counts_all = count_results(t, result_all);
evaluation_all = evaluate(counts_all(1), counts_all(2), counts_all(3), counts_all(4));

print_eval("test", counts, evaluation);
print_eval("all", counts_all, evaluation_all);

disp(["params: ", mat2str(params)])
