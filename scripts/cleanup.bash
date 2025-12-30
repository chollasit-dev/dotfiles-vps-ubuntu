#!/usr/bin/env bash

set -eu -o pipefail

# shellcheck source=./shared.bash
. "$(dirname "$0")/shared.bash"

clean_up_leftover() {
  nala autoremove
}

main() {
  install_package_manager
  clean_up_leftover
}
