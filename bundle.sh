#!/bin/bash

# Set paths
PROJECT_DIR="$(dirname "$0")"
BUNDLE_DIR="$PROJECT_DIR/flapper-ready-to-bundle/game"
OUTPUT_ZIP="$PROJECT_DIR/bundle.zip"

# Clean up previous bundle and zip (ignore if not exists)
rm -rf "$BUNDLE_DIR" 2>/dev/null
rm -f "$OUTPUT_ZIP" 2>/dev/null

# Create bundle directory
mkdir -p "$BUNDLE_DIR"

# Copy main.lua and src to bundle
cp "$PROJECT_DIR/main.lua" "$BUNDLE_DIR/"
cp -R "$PROJECT_DIR/src" "$BUNDLE_DIR/"

# Use zip to create the archive (assuming zip is installed)
zip -r "$OUTPUT_ZIP" "$PROJECT_DIR/flapper-ready-to-bundle/"

echo "Bundle and zip completed: $OUTPUT_ZIP"

