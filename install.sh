#!/bin/bash

BACKUP_DIR=~/Sandworm/Backup/backup_config_$(date +%Y%m%d_%H%M%S)
CONFIG_DIR=~/printer_data/config
SANDWORM_REPO=~/Sandworm/config

echo "🔄 Starting Sandworm update..."

echo "📂 Creating backup of your current config in $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
cp -r "$CONFIG_DIR/"* "$BACKUP_DIR/"

echo "🚀 Updating Sandworm config..."
rsync -av "$SANDWORM_REPO/" "$CONFIG_DIR/"

if [ -f "$SANDWORM_REPO/version.txt" ]; then
    VERSION=$(cat "$SANDWORM_REPO/version.txt")
    echo "📌 Updating to Sandworm version $VERSION"
else
    echo "⚠️ Warning: version.txt not found! Update may be incomplete."
fi

echo "✅ Update complete! Your old config is backed up at $BACKUP_DIR"
echo "⚠️ If you had custom modifications, check the backup folder!"

