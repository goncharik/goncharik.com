#!/bin/bash -eux

GIT_USER_NAME="CircleCI"
GIT_USER_EMAIL="sayhi@circleci.com"
GIT_REPO="git@github.com:${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}.git"

git submodule init
git submodule update
git clone -b master "${GIT_REPO}" public
rm -rf public/*

hugo

cd public
git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"
git add --all
git commit -m '[ci skip] Update'
git push -f origin master
