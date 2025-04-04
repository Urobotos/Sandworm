#!/bin/bash

BACKUP_DIR=~/Sandworm/Backup_config_$(date +%Y%m%d_%H%M%S)
CONFIG_DIR=~/printer_data/config
SANDWORM_REPO=~/Sandworm/config

echo "🔄 Starting Sandworm update..."

# 1. Vytvořit zálohu existujících konfigurací
echo "📂 Creating backup of your current config in $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
cp -r "$CONFIG_DIR/"* "$BACKUP_DIR/"

# 2. Aktualizovat jen soubory, které už existují v Sandworm repozitáři
echo "🚀 Updating Sandworm config..."
rsync -av --update "$SANDWORM_REPO/" "$CONFIG_DIR/"

echo "✅ Update complete! Your old config is backed up at $BACKUP_DIR"
echo "⚠️ If you had custom modifications, check the backup folder!"
