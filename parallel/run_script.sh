#!/bin/bash

echo "Running script $1"
octave ./parallel/run-parallel.m > "./output/out$1.txt";
