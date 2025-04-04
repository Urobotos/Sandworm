#!/bin/bash

BACKUP_DIR=~/Sandworm/Backup/backup_config_$(date +%Y%m%d_%H%M%S)
CONFIG_DIR=~/printer_data/config
SANDWORM_REPO=~/Sandworm/config

echo "🔄 Starting Sandworm update..."

echo "📂 Creating backup of your current config in $BACKUP_DIR"
mkdir -p /Backup "$BACKUP_DIR"
cp -r "$CONFIG_DIR/"* "$BACKUP_DIR/"

echo "🚀 Updating Sandworm config..."
rsync -av --update "$SANDWORM_REPO/" "$CONFIG_DIR/"

echo "✅ Update complete! Your old config is backed up at ~/Sandworm/Backup/$BACKUP_DIR"
echo "⚠️ If you had custom modifications, check the backup folder!"
