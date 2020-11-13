pkg load fuzzy-logic-toolkit

file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/data/data_banknote_authentication.txt'
fis_file = '/mnt/secondary/home/dpliakos/backups/documents_no_code/tei/sem11/fuzzNetworks/assignment1/updated_format.fis'
fis = readfis(fis_file)

plotmf (fis, 'input', 1);
plotmf (fis, 'input', 2);
plotmf (fis, 'input', 3);
plotmf (fis, 'input', 4);
plotmf (fis, 'output', 1);
plotmf (fis, 'output', 2);

## Plot the Heart Disease Risk as a function of LDL-Level and HDL-Level.
gensurf (fis);
