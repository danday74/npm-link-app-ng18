#!/usr/bin/env bash

START_DIR="$(pwd)"
LIB_NAME="umbrella-library"

prefix="OOOOOOOOOO"
libDir="../srs-frontend-libraries"
buildDir="${libDir}/dist/${LIB_NAME}"

if [[ -d "${libDir}" ]]; then
  echo "${prefix} found library directory ${libDir}"
  echo "${prefix} running npm install in library directory"
  npm i --prefix "${libDir}"
  echo
  else
  echo "${prefix} exiting, could not find lib directory ${libDir}"
  exit 1
fi

# do a build if build dir does not exist (build dir is needed to create global link)
if [[ ! -d "${buildDir}" ]]; then
  echo "${prefix} doing a build to create build dir"
  cd "${libDir}" || exit 1
  ng build --configuration development
fi

if [[ -d "${buildDir}" ]]; then
  echo "${prefix} found build directory ${buildDir}"
  else
  echo "${prefix} exiting, could not find build directory ${buildDir}"
  exit 1
fi

cd "${buildDir}" || exit 1
echo "${prefix} creating global link"
npm link
echo

cd "${START_DIR}" || exit 1
echo "${prefix} creating app link"
npm link "${LIB_NAME}"
echo

bash ./scripts/view-links.sh

cd "${libDir}" || exit 1
echo "${prefix} running build watch"
echo
ng build --watch --configuration development
