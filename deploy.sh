#!/bin/bash

# deprated with auto deploy with github action.

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
# hugo -b https://whisperd.tech/resume/
hugo

mv public/* ./

rm -rf public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding resume"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master -f

