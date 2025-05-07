#!/bin/bash

source_dir=/home/ec2-user/logs
if [ -d $source_dir ]; then
    echo "directory exist"
else
    echo "directory doesnot exist"
    exit 1
fi

files=$(find $source_dir -name "*.log" +14)
echo "Files: $files"

while IFS= read -r line
do
    echo "deleting line: $line"
    rm -rf $line
done <<< $files