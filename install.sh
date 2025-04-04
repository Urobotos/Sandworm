#!/bin/bash

SANDWORM_REPO="$HOME/Sandworm/config"
CONFIG_DIR="$HOME/printer_data/config"
BACKUP_DIR="$HOME/Sandworm/Backup/backup_config_$(date +%Y%m%d_%H%M%S)"

# Colors:
OK="\e[32m[OK]\e[0m"
SKIPPED="\e[33m[SKIPPED]\e[0m"
ERROR="\e[31m[ERROR]\e[0m"

echo "🔄 Starting Sandworm update..."

set -Ee
trap 'echo -e "\e[31mERROR:\e[0m Script failed at line $LINENO"' ERR

# Checking UID for root permissions:
if [[ $EUID -ne 0 ]]; then
    echo -e "$ERROR This script must be run as root! I'm trying to run it with sudo..."
    exec sudo "$0" "$@"  # Restarts the script with root privileges
fi

# Funkce pro zálohování souborů s kontrolou:
backup_files() {
    echo "📂 Creating backup of your current config in $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    cp -r "$CONFIG_DIR/"* "$BACKUP_DIR/" || echo -e "$ERROR Backup copy error!" }

# Functions for copying files with control:-
copy_files() {
    echo "🚀 Updating Sandworm config..."
    mkdir -p "$CONFIG_DIR"
    rsync -av "$SANDWORM_REPO/" "$CONFIG_DIR/" || echo -e "$ERROR Update copy error!" }

# Version check function:
version() {
    if [ -f "$SANDWORM_REPO/version.txt" ]; then
       VERSION=$(cat "$SANDWORM_REPO/version.txt")
       echo "📌 Updating to Sandworm version $VERSION"
    else
       echo "⚠️ Warning: version.txt not found! Update may be incomplete."
    fi }

# Functions for cleaning old files:
cleanup() {
    echo "🧹 Cleaning up outdated files..."
    find "$CONFIG_DIR" -name '*.bak' -type f -delete
    echo -e "$OK Cleaning completed." }

# Placeholder for installing dependencies (currently commented)
install_dependencies() {
    echo "🛠 Installing dependencies..."
    # sudo apt-get install -y package_name
    echo -e "$SKIPPED No dependencies needed." }

# Launching functions:
# install_dependencies
backup_files
copy_files
version
cleanup

echo -e "✅ $OK Update complete! Your old config is backed up at $BACKUP_DIR"
echo -e "⚠️ $SKIPPED If you had custom modifications, check the backup folder!"


