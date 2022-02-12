#!/bin/bash

# Set the start date (3 years ago)
# start_date=$(date -d "3 years ago" +%Y-%m-%d)
start_date="2022-01-08"
# Number of commits (2 months = approximately 60 days, every 3 days)
num_commits=$((60 / 3))

# Loop to create commits
for ((i=0; i<num_commits; i++))
do
    # Calculate the date for the commit
    commit_date=$(date -d "$start_date + $((i * 3)) days" +%Y-%m-%d)

    # Create a new file or modify an existing file
    echo "Commit for date $commit_date" > "file_$i.txt"
    
    # Stage the file
    git add "file_$i.txt"
    
    # Commit with the calculated date
    GIT_COMMITTER_DATE="$commit_date 12:00:00" git commit -m "API update for $commit_date" --date "$commit_date 11:00:00"
done

echo "Commits created successfully!"
 
