#!/bin/bash

# Set paths
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_PARENT="$PROJECT_DIR/flapper-ready-to-bundle"
BUNDLE_DIR="$BUNDLE_PARENT/game"
OUTPUT_ZIP="bundle.zip"

# Clean up previous bundle and zip (ignore if not exists)
rm -rf "$BUNDLE_DIR" 2>/dev/null
rm -f "$OUTPUT_ZIP" 2>/dev/null

# Create bundle directory
mkdir -p "$BUNDLE_DIR"

# Copy main.lua and src to bundle
cp "$PROJECT_DIR/main.lua" "$BUNDLE_DIR/"
cp -R "$PROJECT_DIR/src" "$BUNDLE_DIR/"

# Use zip to create the archive (assuming zip is installed)
(
  cd "$BUNDLE_PARENT"
  zip -r "$OUTPUT_ZIP" .
)

# Move the zip archive to the root of the project directory
mv "$BUNDLE_PARENT/$OUTPUT_ZIP" "$PROJECT_DIR/$OUTPUT_ZIP"

echo "Bundle and zip completed: $OUTPUT_ZIP"

