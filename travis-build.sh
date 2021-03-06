#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

cd package/

DEPENDS=$( echo $(sed -e '/^#.*$/d; /^$/d; /^[[:space:]].*$/d' dependencies) | tr ' ' ',')

GIT_COMMIT=$(git rev-parse --short HEAD)

echo "
Section: misc
Priority: optional
Homepage: https://nxos.org
Package: nitrux-hardware-drivers
Version: 1.0.0-${GIT_COMMIT}
Maintainer: Uri Herrera <uri_herrera@nxos.org>
Depends: $DEPENDS
Architecture: amd64
Description: Hardware drivers metapackage for Nitrux.
" > configuration

equivs-build configuration
