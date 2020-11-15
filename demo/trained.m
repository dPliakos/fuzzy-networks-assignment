pkg load fuzzy-logic-toolkit
addpath("./functions") % Adds the functions in the namespace

file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/data/data_banknote_authentication.txt';
fis_file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/demo/trained.fis';

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

y = evalfis(xtest, fis);
y_all =evalfis(x, fis);

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

writefis(fis, "trained.fis")
