file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/data/data_banknote_authentication.txt'
fis_file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/format.fis'
pkg load fuzzy-logic-toolkit

# Read data
data_raw = csvread(file)
data = data_raw(:,:)
x = data(:,1:4)
t = data(:,5)
fis = readfis(fis_file)


% 1960
train_length = round(rows(x)*0.7) - 1
test_length = rows(x) - train_length
xtrain = x(1:train_length,:)
ttrain = t(1:train_length,:)

xtest = x(train_length+1:rows(x),:)
ttest = t(train_length+1:rows(x),:)

% # gia kathe lanthasmeno apatelsma
max_epoch = 4

params = []
counts = []
result = []
for epoch = 1:max_epoch  
  for rule_index = 1:columns(fis.rule)
    fis.rule(rule_index).weight = randi([0 1])
  end
  params(epoch,:) = [fis.rule.weight]

  y = evalfis(xtrain, fis)

  result = []
  for i = 1:rows(y)
    [val, a] = max(y(i,:))
    result(i) = a-1
  end
  
  count_true = 0
  for i = 1:columns(result)
    if result(i) == ttrain(i),
      count_true = count_true + 1
    endif
  end

  counts(epoch) = count_true
end


[best_res best_index] = max(counts)

best_res
best_index

params(best_index,:)


for i=1:columns(fis.rule)
  fis.rule(i).weight = params(best_index,i)
end

y = evalfis(xtest, fis)


result = []
for i = 1:rows(y)
  [val, a] = max(y(i,:))
  result(i) = a-1
end

count_true = 0
for i = 1:columns(result)
  if result(i) == ttrain(i),
    count_true = count_true + 1
  endif
end


disp("rows(xtest):")
rows(xtest)

disp("count_true: ")
count_true
