run_logged() {
  if ! "$@"; then
    log_error "Command failed: $*"
    return 1
  fi
}

log_error() {
  local timestamp=$(date +'%Y-%m-%d %H:%M:%S')
  local LOG_FILE="/home/chin/.var/cron-chin.log"
  mkdir -p "$(dirname "$LOG_FILE")"
  echo "[$timestamp] ERROR: $*" | tee -a "$LOG_FILE" >&2
}

upgrade_system() {
  if ! command -v nala >/dev/null 2>&1; then
    run_logged sudo apt update
    run_logged sudo apt upgrade -y
    run_logged snap refresh
  else
    run_logged sudo nala upgrade -y
  fi
}

install_package_manager() {
  if ! command -v nala >/dev/null 2>&1; then
    run_logged sudo apt install -y nala
  fi
}
