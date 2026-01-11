#!/usr/bin/env bash

# shellcheck source=./shared.bash
source "$(dirname "${BASH_SOURCE[0]}")/shared.bash"

set_up_login_shell() {
  # FIXME: This echo command won't execute.
  echo "deb [trusted=yes] https://apt.fury.io/rsteube/ /" | sudo tee /etc/apt/sources.list.d/fury.list &&
    sudo apt update &&
    sudo nala install -y zsh zsh-syntax-highlighting &&
    sudo nala install carapace # Prevent block or skip the rest when this failed

  command -v zsh >/dev/null 2>&1 && chsh -s "/usr/bin/zsh" &&
    wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh # https://github.com/ohmyzsh/ohmyzsh
}

set_up_essentials() {
  sudo nala install -y "btop" \
    "neovim" \
    "stow" \
    "tldr"
  sudo snap install yazi --classic
}

init() {
  upgrade_system
  install_package_manager
  set_up_login_shell
  set_up_essentials
}
init
