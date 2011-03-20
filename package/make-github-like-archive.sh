#!/bin/bash

rev=v0.1.1
revas=v0.1.1

for i in core qt plugins plugins-nonfree ; do
    cd ../$i
    hash=$(git rev-parse ${revas} | head -c 7)
    package=kompas-$i-$(echo $revas | tail -c +2).tar
    echo $package
    git archive --prefix=mosra-kompas-$i-${hash}/ -o ../package/$package ${rev}
    gzip -n ../package/$package
done
