#!/bin/bash

OLD_USERNAME="Shenque"
NEW_USERNAME="Shenque"

for dir in */ ; do
  if [ -d "$dir/.git" ]; then
    echo "Updating repo: $dir"
    # Get current origin URL
    URL=$(git -C "$dir" remote get-url origin)
    
    # Replace old username with new username
    NEW_URL=${URL//$OLD_USERNAME/$NEW_USERNAME}
    
    # Set the new URL
    git -C "$dir" remote set-url origin "$NEW_URL"
    
    echo "Updated remote URL to: $NEW_URL"
  fi
done
