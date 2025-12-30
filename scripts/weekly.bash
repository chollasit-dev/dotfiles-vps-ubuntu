#!/usr/bin/env bash

set -eu -o pipefail

. "$(dirname "$0")/shared.bash"

upgrade_system

rm "$HOME/.zsh_history" \
  "$HOME/.bash_history" \
  &>/dev/null
