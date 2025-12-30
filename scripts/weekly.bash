#!/usr/bin/env bash

# shellcheck source=./shared.bash
source "$(dirname "${BASH_SOURCE[0]}")/shared.bash"

upgrade_system

rm "$HOME/.zsh_history" \
  "$HOME/.bash_history" \
  >/dev/null 2>&1
