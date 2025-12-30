#!/usr/bin/env bash

# shellcheck source=./shared.bash
source "$(dirname "${BASH_SOURCE[0]}")/shared.bash"

clean_up_leftover() {
  sudo nala autoremove
}

main() {
  install_package_manager
  clean_up_leftover
}
