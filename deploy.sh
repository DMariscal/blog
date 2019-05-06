#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Add first the changes to the blog source
git add .
git commit -m "$1"
git push origin master

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd MarshalGames.github.io
# Add changes to git.
git add .

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Commit changes.
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..