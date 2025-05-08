#!/bin/bash


#!/bin/bash

# Script to check if any xfs filesystem has usage over 50%

# Set the usage threshold
THRESHOLD=50

echo "Checking XFS filesystems with usage over $THRESHOLD%..."
echo "-----------------------------------------------"

# Get the list of xfs filesystems with usage over threshold
overused=$(df -hT | awk -v threshold=$THRESHOLD '$2 == "xfs" && int($6) > threshold')

# Check if any filesystem matched the condition
if [[ -n "$overused" ]]; then
    echo "WARNING: The following XFS filesystems have usage over ${THRESHOLD}%:"
    echo "$overused"
else
    echo "All XFS filesystems are under ${THRESHOLD}% usage."
fi
