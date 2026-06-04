#!/bin/bash

while true
do
    fswatch -1 .
    git add .
    git commit -m "Auto update $(date '+%Y-%m-%d %H:%M:%S')" || true
    git push origin main
done
