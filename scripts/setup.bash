#!/usr/bin/env bash

set -eu -o pipefail

. "$(dirname "$0")/shared.bash"

set_up_login_shell() {
  echo "deb [trusted=yes] https://apt.fury.io/rsteube/ /" >/etc/apt/sources.list.d/fury.list &&
    apt update &&
    nala install -y carapace zsh zsh-syntax-highlighting &&
    chsh -s "$(which zsh)" &&
    zsh &&
    wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh # https://github.com/ohmyzsh/ohmyzsh
}

set_up_essentials() {
  nala install -y "btop" \
    "neovim" \
    "stow" \
    "tldr"
  snap install yazi --classic
}

set_up_orchestrator() {
  # https://docs.dokploy.com/docs/core/installation#docker
  curl -sSL https://dokploy.com/install.sh | sh
}

inherit_configuration() {
  files=(
    ".gitconfig"
    ".gitattributes"
  )
  for file in "${files[@]}"; do
    [ -f "$HOME/$file" ] && rm "$HOME/$file"
    wget "https://github.com/chollasit-dev/shared-configs/blob/main/$file"
  done
}

init() {
  upgrade_system
  install_package_manager
  set_up_login_shell
  set_up_orchestrator
  inherit_configuration
}
init
