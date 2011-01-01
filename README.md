Kompas is an portable navigation system with goal to be as multiplatform and
extensible as possible. Its core library is written in pure C++ with no
external dependencies, on top of it is Qt and SDL GUI. The application is
licensed under LGPLv3.

This repository encapsulates these projects:

 * kompas-core               - Core Kompas library
 * kompas-qt                 - Kompas GUI written in Qt
 * kompas-sdl                - Kompas GUI written in SDL
 * kompas-plugins            - Kompas plugins
 * kompas-plugins-nonfree    - Non-free Kompas plugins
 * kompas-artwork            - Complete Kompas artwork

INITIALIZATION (if you have this as Git repository)
===================================================

This is a so-called Git superproject. The purpose of an superproject is to
aggregate more projects into one repository, so the developer doesn't need
to manage every project separately. Git doesn't automatically fetch all
submodules upon cloning, it has to be done manually. To initialize submodules,
run

    git submodule init

This will initialize the submodule configuration in .git/config. You can then
modify submodule URLs for your local setup, if you want. Then run

    git submodule update

to fetch all sub-repositories. This command should be run after every git pull
of this repository, but it can also cause data loss. More info in Git manual.

INSTALLATION
============

Recommended way is to compile and install every subproject manually, as every
installable subproject contains also packaging scripts for some distributions.
Everything what you need is then described in subprojects̈́' READMEs.

Or you can compile and install everything together.

Dependencies
------------

Roughly these, but some plugins would probably require another dependencies,
check READMEs in plugins/ and plugins-nonfree/ subdirectories.

 * CMake    - for building
 * Qt       - for Qt GUI
 * SDL      - for SDL GUI

Compilation, installation
-------------------------

    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr .. && make
    make install

If you want to build also unit tests (which are not built by default),
pass -DBUILD_TESTS=True to CMake. Unit tests use QtTest framework.

CONTACT
=======

Want to learn more about the application? Found a bug or want to tell me an
awesome idea? Feel free to visit project website or contact me at:

 * Website - http://mosra.cz/blog/kompas.php
 * GitHub - http://github.com/mosra
 * E-mail - mosra@centrum.cz
 * Jabber - mosra@jabbim.cz
