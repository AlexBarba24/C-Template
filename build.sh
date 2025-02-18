#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define build directories
BUILD_DIR="build"
BIN_DIR="bin"

# Remove old build directories
echo "Cleaning previous builds..."
rm -rf "$BUILD_DIR" "$BIN_DIR"

# Create necessary directories
mkdir -p "$BUILD_DIR/Debug" "$BUILD_DIR/Release"

# Function to build a specific configuration
build_config() {
    CONFIG=$1
    echo "Building $CONFIG..."
    cd "$BUILD_DIR/$CONFIG"
    cmake ../.. -DCMAKE_BUILD_TYPE=$CONFIG
    cmake --build .
    cd ../..
}

# Build Debug and Release
build_config Debug
build_config Release

echo "Build complete!"
echo "Executables:"
echo " - Debug:   $BIN_DIR/Debug/main"
echo " - Release: $BIN_DIR/Release/main"
