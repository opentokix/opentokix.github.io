#!/bin/bash
 
if [[ ! "$@" ]]; then 
    m="Lazy commit message"
else
    m=$@
fi

git add -A
git commit -a -m "${m}"
git push
jekyll build --source . --destination ../opentokix.github.io 
cd ../opentokix.github.io
git add -A
git commit -a -m "${m}"
git push
