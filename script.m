file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/data/data_banknote_authentication.txt'
fis_file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/format.fis'
pkg load fuzzy-logic-toolkit

# Read data

data = csvread(file)

x = data(:,1:4)
t = data(:,5)


# prepare the anfis environment
readfis(fis_file)


# Execute the computation


# Read output



