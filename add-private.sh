#!/bin/bash

dirs=(
	"packages/apps/Settings/"
	"frameworks/base/"
	"vendor/nezuko/"
)

remotes=(
	"git@github.com:NezukoOS/sextings.git"
	"git@github.com:NezukoOS/priv_frameworks_base.git"
	"git@github.com:NezukoOS/priv_vendor_nezuko.git"
)

i=0

for dir in "${dirs[@]}"; do
    cd ~/Nezuko/${dir}
    git branch | grep "(no branch, rebasing priv)" && git rebase --quit && git reset --hard 
    git switch --detach
    git branch --list "priv" && git branch -D priv
    (git remote | grep "private") || git remote add private ${remotes[i]}
    git fetch private
    git checkout -b priv private/eleven
    ((i++))
done

