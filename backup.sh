#!/bin/bash

source_dir=$1
dest_dir=$2
days=${3:-14}
    
if [ $# -lt 2 ]; then
    echo "usage: sh backup.sh <source> <destination> <days(optional)>"
fi

if [ ! -d "$source_dir" ] || [ ! -d "$dest_dir" ] ; then
    [ ! -d "$source_dir" ] && echo "Source_dir doesnot exist"
    [ ! -d "$dest_dir" ] && echo "dest_dir doesnot exist"
fi

files=$( find "$source_dir" -type f  -name "*.log" -mtime +14)

if [ ! -z $files ]; then
    echo "files found"
    
else 
    echo "no files found older than 14"
fi


    
