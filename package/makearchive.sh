version=0.1

rm -f kompas-${version}.tar{,.gz} core.tar qt.tar plugins.tar plugins-nonfree.tar

cd ../core
git archive --prefix=kompas-${version}/core/ -o ../package/core.tar v${version} \
    || return 1

cd ../qt
git archive --prefix=kompas-${version}/qt/ -o ../package/qt.tar v${version} \
    || return 1

cd ../plugins
git archive --prefix=kompas-${version}/plugins/ -o ../package/plugins.tar v${version} \
    || return 1

cd ../plugins-nonfree
git archive --prefix=kompas-${version}/plugins-nonfree/ -o ../package/plugins-nonfree.tar v${version} \
    || return 1

cd ..
git archive --prefix=kompas-${version}/ -o package/kompas-${version}.tar v${version} \
    || return 1
cd package

tar --concatenate --file=kompas-${version}.tar \
    core.tar

tar --concatenate --file=kompas-${version}.tar \
    qt.tar

tar --concatenate --file=kompas-${version}.tar \
    plugins.tar

tar --concatenate --file=kompas-${version}.tar \
    plugins-nonfree.tar

gzip kompas-${version}.tar
