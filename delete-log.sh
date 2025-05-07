#!/bin/bash

source_dir=/home/ec2-user/logs
if [ -d $source_dir ]; then
    echo "directory exist"
else
    echo "directory doesnot exist"
    exit 1
fi
