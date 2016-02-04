#!/bin/bash

# use according mirror when building for Ubuntu
case "${distribution}" in
  trusty|precise|lucid)
    export MIRROR="http://ie.archive.ubuntu.com/ubuntu/"
    echo "*** Building for Ubuntu release ${distribution}, using mirror ${MIRROR} ***"
    ;;
  lenny)
    export MIRROR="http://archive.debian.org/debian/"
    echo "*** Building for Debian release lenny, using mirror ${MIRROR} ***"
esac

# sadly piuparts always returns with exit code 1 :((
sudo piuparts_wrapper "${PWD}"/artifacts/*.deb || true

# generate TAP report
piuparts_tap piuparts.txt > piuparts.tap
