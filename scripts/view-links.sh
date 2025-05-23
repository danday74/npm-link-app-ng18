#!/usr/bin/env bash

LIB_NAME="umbrella-library"
prefix="OOOOOOOOOO"

echo "${prefix} viewing global link:"
npm ls -g "${LIB_NAME}"

echo "${prefix} viewing app link: (safely ignore invalid)"
npm ls "${LIB_NAME}" 2>/dev/null || true
