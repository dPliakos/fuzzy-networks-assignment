#!/bin/bash

echo "Running script $1"
octave ./script.m > "./output/out$1.txt";
