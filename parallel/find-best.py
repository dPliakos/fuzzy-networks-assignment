#!/usr/env/python

from os import listdir

files = listdir("output")

max_test_fmeasure=0
max_all_fmeasure=0
max_test_filename=""
max_all_filename=""


for filename in files:
  with open("output/"+filename, "r") as f:
    contents = f.read()

    for line in contents.split('\n'):
      if 'test-f_measure' in line:
        fm = float(line.split(':')[1])
      elif  'all-f_measure' in line:
        fm_all = float(line.split(':')[1])

    if fm > max_test_fmeasure:
      max_test_fmeasure = fm
      max_test_filename = filename

    if (fm_all > max_all_fmeasure):
      max_all_fmeasure = fm_all
      max_all_filename = filename


print("Best test fmeasure: ", max_test_fmeasure, " on", max_test_filename)
print("Best all fmeasure: ", max_all_fmeasure, " on", max_all_filename)
