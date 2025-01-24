#!/bin/bash


SCRIPT_DIR=$(dirname "$(realpath "$0")")
echo $SCRIPT_DIR

if [ $# -ne 2 ]; then
    echo "Usage: $0 <version> <kernel_name>"
    exit 1
fi

# Parse CLI arguments
VERSION=$1
KERNEL_NAME=$2

for notebook in "$SCRIPT_DIR/book"/*.ipynb; do
    # Check if the notebook exists (handles empty folders)
    if [ -e $notebook ]; then
        echo "Changing kernel version for: $notebook"
        python patch_kernel_version.py --notebook_path "$notebook" --version "$VERSION" --kernel_name "$KERNEL_NAME"
    fi
done

