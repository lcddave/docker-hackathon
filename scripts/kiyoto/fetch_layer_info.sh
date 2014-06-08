#!/bin/bash

# Assume this script is run from the project root
SCRIPT=scripts/vendor/docker-registry-debug

if [ ! -f $SCRIPT ]
then
  echo "in the wrong directory"
  exit
fi


image_id=`$SCRIPT info $1 | grep '^    latest' -m 1 | awk '{ print $2}'`

if [ "$image_id" == "" ]
then
  echo "does not exit."
  exit
fi

$SCRIPT layerinfo $1 $image_id 
