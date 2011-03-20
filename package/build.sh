#!/bin/bash

for i in core qt plugins plugins-nonfree ; do
    cd ../$i
    su mosra -c "makepkg -f"
    pacman -U --noconfirm kompas-$i*.tar.xz
done

cd ../build ; su mosra -c "make -j5"
