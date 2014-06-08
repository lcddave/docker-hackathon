#!/bin/bash

# A grab bag of the shell scripts to analyze index.docker.io data
# I assume that this is run from the project root

ruby -e 'STDIN.each_line {|x| puts x.split("/").first}' < data/repo_names.txt | sort | uniq -c | wc -l
