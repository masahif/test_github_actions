#!/bin/sh -l

echo "Hello $1"
time=$(date)

export PATH=/usr/bin:$PATH

/usr/bin/yum install -y gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel \
    openssl-devel tk-devel libffi-devel xz-devel git tar bzip2
/usr/bin/git clone https://github.com/pyenv/pyenv.git ~/pyenv
/usr/bin/mkdir /mnt/python/

cd ~/pyenv/plugins/python-build
./install.sh
/usr/local/bin/python-build 3.7.9 /mnt/python
ARCHIVE_NAME='python-3.7.9-amzn2.tar.bz'
/usr/bin/tar cvfj /tmp/$ARCHIVE_NAME -C / /mnt/python

echo "::set-output name=time::$time"
