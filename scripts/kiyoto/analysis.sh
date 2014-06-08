#!/bin/bash

# A grab bag of the shell scripts to analyze index.docker.io data
# I assume that this is run from the project root

ruby -e 'STDIN.each_line {|x| puts x.split("/").first}' < data/repo_names.txt | sort | uniq -c | wc -l

# MongoDB Scripts for some descriptive statistics

mongo ds061787.mongolab.com:61787/docker-hackathon -u dockerlove -p dockerlove --eval 'db.raw.metadata.group( { key: { _id: 1}, reduce: function(curr, result) { result.total += curr.Ancestry.length }, initial: { total: 0} }).sort(function(x,y) { return x["total"]-y["total"]}).forEach(function(el){print(el._id+" "+el.total)})'

mongo ds061787.mongolab.com:61787/docker-hackathon -u dockerlove -p dockerlove --eval 'db.raw.metadata.group({ reduce: function(x, y) { y.total += 1 }, initial:{total:0}, keyf:function(d){return {month_key:d.Created.slice(0, 7)}}}).forEach(function(el){ print(el.month_key + "\t" + el.total)})'
