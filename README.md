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

## Step 2: Gathering metadata about the repos

Now that you have a reasonable # of repo names, you want to fetch their metadata. Andy@Docker pointed
me to [this nifty tool](https://github.com/samalba/docker-registry-debug/) to pull metadata.

Actually, I ended up modifying the original (along the way, **learning to read and write some Go for
the first time**). My fork is [here](https://github.com/kiyoto/docker-registry-debug/commit/f20d6d1161eb98ad1d79869690e1dd34203bae41).

6/8/2014 1145h: Done collecting the data. There are 13,475 repositories with 11,251 distinct image ids
The data is in `data/updates_repo_names.json` and `data/tree_image_ids.json`. The script is to "invert"
the response of Docker API since we want to know which image id has the most children images.

## Step 3: Webapp for the genealogy

[Here](http://dockerology.herokuapp.com) is a minimal webapp that lets you traverse the image id tree.

Some interesting data (as of 6/8/2014)

* 13,475 repos found
* 101,477 image ids found
* 792 "root" image ids

