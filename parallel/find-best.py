#!/usr/env/python

from os import listdir
import sys

files = listdir("output")

max_test_fmeasure=0
max_all_fmeasure=0
max_test_filename=""
max_all_filename=""
min_err_test = sys.maxsize
min_err_all = sys.maxsize
min_err_test_filename = ""
min_err_all_filename = ""


for filename in files:
  if (filename == ".gitkeep"):
    continue

  with open("output/"+filename, "r") as f:
    contents = f.read()

    for line in contents.split('\n'):
      if 'test-f_measure' in line:
        fm = float(line.split(':')[1])
      elif 'all-f_measure' in line:
        fm_all = float(line.split(':')[1])
      elif 'test-Error' in line:
        min_err = float(line.split(':')[1])
      elif 'all-Error' in line:
        err_all = float(line.split(':')[1])

    if fm > max_test_fmeasure:
      max_test_fmeasure = fm
      max_test_filename = filename

    if (fm_all > max_all_fmeasure):
      max_all_fmeasure = fm_all
      max_all_filename = filename

    if min_err < min_err_test:
      min_err_test = min_err
      min_err_test_filename = filename

    if err_all < min_err_all:
      min_err_all = err_all
      min_err_all_filename = filename


print("Best test fmeasure: ", max_test_fmeasure, " on", max_test_filename)
print("Best all fmeasure: ", max_all_fmeasure, " on", max_all_filename)
print("Best test error: ", min_err_test, " on", min_err_test_filename)
print("Best all error: ", min_err_all, " on", min_err_all_filename)
