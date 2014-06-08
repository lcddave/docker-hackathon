docker-hackathon
================

Docker Hackathon: "Data Science" on index.docker.io

I am collecting (most of the work) and analyzing (most of the fun) of index.docker.io-related stats.

This would be a little easier if I could infiltrate into index.docker.io, but that would be less fun.

Since I won't have an app to show and my commits will look cryptic, I will document what I am doing.

## Step 1: Gathering repo names

I am using their [search api](http://docs.docker.io/reference/api/docker-io_api/) for this.

Specifically, my search term is an increasingly long sequence of alphabets. I spun up an instance
on EC2 and ran `scripts/kiyoto/search.sh` with different search terms.
