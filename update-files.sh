#!/bin/bash

echo '[+] Removing old files ...'
for i in `cat files.list`; do
    rm -v $(basename $i)
done
rm -v *.sha256sum

echo '[+] Downloading files ...'
wget -i files.list

echo '[+] Creating checksums (sha256) ...'
for i in `cat files.list`; do
    sha256sum $(basename $i) \
        > $(basename $i).sha256sum
done
