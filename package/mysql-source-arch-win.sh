#!/bin/bash

version=0.1.2
version_win=$version

package() {
    echo "INSERT INTO documents (sectionid, langid, classid, nick, caption, filesize, extension) VALUES (3, 2, 5, \"tarball/kompas-$1-$version\", \"Kompas $1 $ver (source package)\", $(du -B1 kompas-$1-$version.tar.gz | cut -f1), \"tar.gz\");" >> source-arch-win.sql

    echo "INSERT INTO documents (sectionid, langid, classid, nick, caption, filesize, extension) VALUES (3, 2, 5, \"archlinux/kompas-$1-$version-1\", \"Kompas $1 $ver (ArchLinux package)\", $(du -B1 ../$1/package/archlinux/kompas-$1/kompas-$1-$version-1.src.tar.gz | cut -f1), \"src.tar.gz\");" >> source-arch-win.sql
}

package core "Core library"
package qt "Qt GUI"
package plugins "Plugins"
package plugins-nonfree "Non-free plugins"

echo "INSERT INTO documents (sectionid, langid, classid, nick, caption, filesize, extension) VALUES (3, 2, 5, \"windows/kompas-$version_win-installer\", \"Kompas $ver (Windows installer)\", $(du -B1 ../build-win/kompas-$version_win-installer.exe | cut -f1), \"exe\");" >> source-arch-win.sql
