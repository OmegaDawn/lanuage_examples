#!/bin/bash

# Constants
BACKUP_DIR="/backup"
DATE_FORMAT="%Y-%m-%d_%H-%M-%S"

# Function to create a backup
create_backup() {
    local source_dir=$1
    local backup_file="$BACKUP_DIR/backup_$(date +"$DATE_FORMAT").tar.gz"

    if [[ ! -d "$source_dir" ]]; then
        echo "Error: Source directory does not exist" >&2
        return 1
    fi

    echo "Creating backup of $source_dir..."
    tar -czf "$backup_file" -C "$source_dir" .

    if [[ $? -eq 0 ]]; then
        echo "Backup successfully created: $backup_file"
        return 0
    else
        echo "Error: Backup creation failed" >&2
        return 1
    fi
}

# Function to list backups
list_backups() {
    echo "Available backups:"
    ls -lh "$BACKUP_DIR"/*.tar.gz
}

# Main execution block
{
    # Check if backup directory exists, create if not
    if [[ ! -d "$BACKUP_DIR" ]]; then
        mkdir -p "$BACKUP_DIR"
        if [[ $? -ne 0 ]]; then
            echo "Error: Could not create backup directory" >&2
            exit 1
        fi
    fi

    # Command-line argument handling
    case $1 in
        backup)
            create_backup "$2"
            ;;
        list)
            list_backups
            ;;
        *)
            echo "Usage: $0 {backup|list} [source_directory]" >&2
            exit 1
            ;;
    esac
}
