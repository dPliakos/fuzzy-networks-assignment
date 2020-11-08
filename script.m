file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/data/data_banknote_authentication.txt'
fis_file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/format.fis'
pkg load fuzzy-logic-toolkit

# Read data

data = csvread(file)

x = data(:,1:4)
t = data(:,5)


# prepare the anfis environment
fis = readfis(fis_file)


# Execute the computation

# Attempt to run defuzzify
y = evalfis(x, fis)

# Read output

result = []
for i = 1:rows(y)
  [val, a] = max(y(i,:))
  result = [result; a-1]
end



result


count_true = 0

for i = 1:rows(result)
  if result(i) == t(i),
    disp("yey!")
    count_true = count_true + 1
  endif
end


disp("Number of yeys = ")
disp(count_true)
disp(rows(t))
disp(rows(t) - count_true)
























%  BNackup

% flag=0
% for i=1:rows(output)
%   if output(i,1) == 1,
%     flag=1
%   endif;
% end;

% if flag == 1,
%   disp("Nai re pousti")
% endif
