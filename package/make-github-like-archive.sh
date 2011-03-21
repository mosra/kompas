#!/bin/bash

rev=v0.1.2
revas=v0.1.2

for i in core qt plugins plugins-nonfree ; do
    cd ../$i
    hash=$(git rev-parse ${revas} | head -c 7)
    package=kompas-$i-$(echo $revas | tail -c +2).tar
    echo $hash $package
    git archive --prefix=mosra-kompas-$i-${hash}/ -o ../package/$package ${rev}
    gzip -nf ../package/$package
done
