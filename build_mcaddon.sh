#!/usr/bin/env bash
set -eu

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_NAME="anime_abilities_pack.mcaddon"
TMP_DIR="${ROOT_DIR}/.mcaddon_tmp"

rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

# Copy only the addon content, excluding build scripts and temp dirs
cp -R "$ROOT_DIR/behavior_packs" "$TMP_DIR/"
cp -R "$ROOT_DIR/resource_packs" "$TMP_DIR/"
cp "$ROOT_DIR/manifest.json" "$TMP_DIR/manifest.json"

cd "$TMP_DIR"
zip -r "$ROOT_DIR/$OUTPUT_NAME" .

rm -rf "$TMP_DIR"

echo "Created: $ROOT_DIR/$OUTPUT_NAME"
