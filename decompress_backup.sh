#!/bin/bash
# maxhaase@gmail.com

# Check if a file name was provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <backup-file.tar.gz>"
    exit 1
fi

# The backup file provided as the first argument
BACKUP_FILE="$1"

# Validate that the file exists
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: File '$BACKUP_FILE' not found."
    exit 1
fi

# Extract the directory name from the backup file name
DIR_NAME=$(basename "$BACKUP_FILE" .tar.gz)

# Create the directory if it doesn't already exist
if [ ! -d "$DIR_NAME" ]; then
    mkdir -p "$DIR_NAME"
else
    echo "Directory '$DIR_NAME' already exists. Exiting to prevent overwriting."
    exit 1
fi

# Decompress the backup file into the created directory
tar -xzf "$BACKUP_FILE" -C "$DIR_NAME"

echo "Backup '$BACKUP_FILE' has been decompressed into directory '$DIR_NAME'."
