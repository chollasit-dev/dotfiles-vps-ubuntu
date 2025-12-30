upgrade_system() {
  if ! command -v nala &>/dev/null; then
    apt update && apt upgrade -y && snap refresh
  else
    nala upgrade -y
  fi
}

install_package_manager() {
  if ! command -v nala &>/dev/null; then
    apt install -y nala
  fi
}
