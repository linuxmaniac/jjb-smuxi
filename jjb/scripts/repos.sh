#!/bin/bash
export BASE_PATH="binaries/"
export PROVIDE_ONLY=true
export REPOSITORY="/srv/repository/${JOB_NAME%-repos*}"
export REPOS="${distribution}"
export SKIP_REMOVAL=true

generate-reprepro-codename "${REPOS}"
build-and-provide-package
