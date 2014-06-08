#!/bin/bash

# Assume this script is run from the project root
SCRIPT=scripts/vendor/docker-registry-debug

if [ ! -f $SCRIPT ]
then
  echo "in the wrong directory"
  exit
fi


image_id=`$SCRIPT info $1 | egrep '^    [^ ]+    [a-f0-9]+' -m 1 | awk '{print $2}'`
if [ "$image_id" == "" ]
then
  echo "$1 does not exist."
  exit
fi

json=`$SCRIPT layerinfo $1 $image_id` 
echo "$1    $json"
