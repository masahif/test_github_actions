#!/bin/sh -l

echo "Hello $1"
time=$(date)

sudo yum install -y gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel \
    openssl-devel tk-devel libffi-devel xz-devel git
git clone https://github.com/pyenv/pyenv.git ~/pyenv
pushd ~/pyenv/plugins/python-build

mkdir /mnt/python/
sudo ./install.sh
/usr/local/bin/python-build 3.7.9 /mnt/python
ARCHIVE_NAME='python-3.7.9-amzn2.tar.bz'
tar cvfj /tmp/$ARCHIVE_NAME -C / /mnt/python

echo "::set-output name=time::$time"
