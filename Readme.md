## Create a new repository on the command line
touch README.md \
git init \
git add README.md \
git commit -m "first commit" \
git remote add origin https://github.com/sema1011/overlay.git \
git push -u origin master

## Push an existing repository from the command line
git remote add origin https://github.com/sema1011/overlay.git \
git push -u origin master


## Update
git add --all \
git commit -m "first commit" \
git push -u origin master

https://toster.ru/q/231161

wget https://raw.githubusercontent.com/sema1011/overlay/master/metadata/home.conf -O /etc/portage/repos.conf/home


## Repoman status
[![Repoman Status](https://travis-ci.org/sema1011/overlay.svg?branch=master)](https://travis-ci.org/sema1011/overlay)
