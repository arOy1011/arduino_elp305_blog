#!/bin/bash

echo "Watching source files..."

while true
do
    fswatch -1 \
        --exclude=".*/\\.git/.*" \
        --exclude=".*node_modules.*" \
        .

    git add .

    if ! git diff --cached --quiet; then
        git commit -m "Auto update $(date '+%Y-%m-%d %H:%M:%S')"
        git push origin main
        echo "Pushed successfully."
    fi
done
