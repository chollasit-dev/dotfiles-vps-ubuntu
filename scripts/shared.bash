upgrade_system() {
  if ! command -v nala >/dev/null 2>&1; then
    sudo apt update && sudo apt upgrade -y && snap refresh
  else
    sudo nala upgrade -y
  fi
}

install_package_manager() {
  if ! command -v nala >/dev/null 2>&1; then
    sudo apt install -y nala
  fi
}
