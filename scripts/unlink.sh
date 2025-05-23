#!/usr/bin/env bash

LIB_NAME="umbrella-library"
prefix="OOOOOOOOOO"

echo "${prefix} removing global link"
npm unlink -g "${LIB_NAME}"
echo

echo "${prefix} removing app link"
npm i "${LIB_NAME}"
echo

bash ./scripts/view-links.sh
