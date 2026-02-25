#!/bin/sh

set -e

INPUT_IMAGE="icon.png"
OUTPUT_DIR="icons"

if [ ! -f "$INPUT_IMAGE" ]; then
    echo "Input file '$INPUT_IMAGE' not found."
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

echo "Generating PNG icons..."

for size in 16 32 48 64 128 192 256 512; do
    magick "$INPUT_IMAGE" -resize ${size}x${size} "$OUTPUT_DIR/icon-${size}.png"
    echo "Created icon-${size}.png"
done

echo "All icons generated successfully."
