#!/bin/bash

ver=0.1.2

mkdir -p download-obs
cd download-obs

echo -n > insert.sql

# $1 - path in OBS's URL
# $2 - directory where to save
# $3 - human readable distribution name
# $4 - patch version
# $5 - architecture
# $6 - human readable architecture

dl_deb_internal() {
    package=kompas-${7}${9}_${ver}_$5
    echo "    $package.deb"

    wget -nc -q http://download.opensuse.org/repositories/home:/mosra/$1/$5/kompas-${7}${9}_${ver}-${4}_$5.deb -O $package.deb

    echo "INSERT INTO documents (sectionid, langid, classid, nick, caption, filesize, extension) VALUES (3, 2, 5, \"$2/$package\", \"Kompas $8 $ver ($3 $6 package)\", $(du -B1 $package.deb | cut -f1), \"deb\");" >> ../insert.sql

    if [ -z "$9" ] ; then
        dl_deb_internal "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" -dev
    fi
}

dl_rpm_internal() {
    package=kompas-$7$9-$ver.$5
    echo "    $package.rpm"

    wget -nc -q http://download.opensuse.org/repositories/home:/mosra/$1/$5/kompas-$7$9-$ver-$4.$5.rpm -O  $package.rpm

    echo "INSERT INTO documents (sectionid, langid, classid, nick, caption, filesize, extension) VALUES (3, 2, 5, \"$2/$package\", \"Kompas $8 $ver ($3 $6 package)\", $(du -B1 $package.rpm | cut -f1), \"rpm\");" >> ../insert.sql

    if [ -z "$9" ] ; then
        dl_rpm_internal "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" -devel
    fi
}

dl_rpm() {
    mkdir -p $2
    cd $2

    echo $2 $6

    dl_rpm_internal "$1" "$2" "$3" "$4" "$5" "$6" core              "Core library"
    dl_rpm_internal "$1" "$2" "$3" "$4" "$5" "$6" qt                "Qt GUI"
    dl_rpm_internal "$1" "$2" "$3" "$4" "$5" "$6" plugins           "Plugins"
    dl_rpm_internal "$1" "$2" "$3" "$4" "$5" "$6" plugins-nonfree   "Non-free plugins"

    cd ..
}

dl_deb() {
    mkdir -p $2
    cd $2

    echo $2 $6

    dl_deb_internal "$1" "$2" "$3" "$4" "$5" "$6" core              "Core library"
    dl_deb_internal "$1" "$2" "$3" "$4" "$5" "$6" qt                "Qt GUI"
    dl_deb_internal "$1" "$2" "$3" "$4" "$5" "$6" plugins           "Plugins"
    dl_deb_internal "$1" "$2" "$3" "$4" "$5" "$6" plugins-nonfree   "Non-free plugins"

    cd ..
}

dl_rpm openSUSE_11.3 opensuse-11.3 "openSUSE 11.3"          1.1 i586    32bit
dl_rpm openSUSE_11.3 opensuse-11.3 "openSUSE 11.3"          1.1 x86_64  64bit

dl_rpm openSUSE_11.4 opensuse-11.4 "openSUSE 11.4"          1.1 i586    32bit
dl_rpm openSUSE_11.4 opensuse-11.4 "openSUSE 11.4"          1.1 x86_64  64bit

dl_rpm openSUSE_Factory opensuse-factory "openSUSE Factory" 1.1 i586    32bit
dl_rpm openSUSE_Factory opensuse-factory "openSUSE Factory" 1.1 x86_64  64bit

dl_rpm Fedora_13 fedora-13 "Fedora 13"                      1.1 i386    32bit
dl_rpm Fedora_13 fedora-13 "Fedora 13"                      1.1 x86_64  64bit

dl_rpm Fedora_14 fedora-14 "Fedora 13"                      1.1 i386    32bit
dl_rpm Fedora_14 fedora-14 "Fedora 13"                      1.1 x86_64  64bit

dl_rpm Mandriva_2010.1 mandriva-2010.1 "Mandriva 2010.1"    1.1 i586    32bit
dl_rpm Mandriva_2010.1 mandriva-2010.1 "Mandriva 2010.1"    1.1 x86_64  64bit

dl_deb Debian_6.0 debian-6 "Debian 6"                       1   i386    32bit
dl_deb Debian_6.0 debian-6 "Debian 6"                       1   amd64   64bit

dl_deb xUbuntu_10.04 ubuntu-10.04 "Ubuntu 10.04"            1   i386    32bit
dl_deb xUbuntu_10.04 ubuntu-10.04 "Ubuntu 10.04"            1   amd64   64bit

dl_deb xUbuntu_10.10 ubuntu-10.10 "Ubuntu 10.10"            1   i386    32bit
dl_deb xUbuntu_10.10 ubuntu-10.10 "Ubuntu 10.10"            1   amd64   64bit
