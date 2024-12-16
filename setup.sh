#!/bin/bash

set -eu -o pipefail

is_exist_command() {
  type -a "${1}" >/dev/null 2>&1
}

is_macos() {
   [[ "$(/usr/bin/uname -s)" = "Darwin" ]]
}

if ! is_macos; then
  echo "This script is for MacOS."
  echo "Abort."
  exit 1
fi

if ! is_exist_command go; then
  echo "Install Golang tool."
  echo "cf. https://go.dev/doc/manage-install)"
  echo "Abort."
  exit 1
fi

if ! is_exist_command brew; then
  echo "Install Homebrew."
  echo "(https://brew.sh/) to use brew command."
  echo "Abort."
  exit 1
fi

brew install shfmt
brew install shellcheck
brew install tfenv
