#!/bin/bash

source_dir="$1"
dest_dir="$2"
days="${3:-14}"
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
zip_file="$dest_dir/app-logs-$timestamp.zip"
    
if [ $# -lt 2 ]; then
    echo "usage: sh backup.sh <source> <destination> <days(optional)>"
    exit 1
fi

if [ ! -d "$source_dir" ] || [ ! -d "$dest_dir" ] ; then
    [ ! -d "$source_dir" ] && echo "Source_dir doesnot exist"
    [ ! -d "$dest_dir" ] && echo "dest_dir doesnot exist"
fi

files=$(find "$source_dir" -type f  -name "*.log" -mtime +"$days")
echo "Files: $files"

if [ -n "$files" ]; then
    echo "files found. zipping..."
    find "$source_dir" -type f -name "*.log" -mtime +14 | zip "$zip_file" -@
    if [ -f "$zip_file" ]; then
        echo "successfully zipped the older files to: $zip_file"
        echo "$files" | xargs rm -f
    else
        echo "file zip failed"
        exit 1
    fi   
else 
        echo "no files found older than $days days"
fi


    
