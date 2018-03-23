#!/bin/bash

name=$1

image=`echo $name | sed 's/:.*//g'`
tag=`echo $name | sed 's/.*://g'`

dir=$image/$tag
file=$image/$tag/Dockerfile

echo "mkdir $dir"
mkdir -p $dir

echo "create Dockerfile"
if [ -f $file ]; then
  echo "Error: $file is exists"
  exit 1
else
  echo "FROM $name" > $file
fi
