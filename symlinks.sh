#!/bin/bash

# Check if the input file exists
input_file="files"
if [[ ! -f "$input_file" ]]; then
    echo "Error: $input_file does not exist."
    exit 1
fi

# Create symbolic links for each directory path in the input file
while IFS= read -r path; do
    if [[ -d "$path" ]]; then
        link_path="/home/$(basename "$path")"
        if [[ -e "$link_path" ]]; then
            echo "Error: Symbolic link already exists for $path"
        else
            # Check if parent directories exist, and create them if needed
            parent_dir=$(dirname "$link_path")
            if [[ ! -d "$parent_dir" ]]; then
                mkdir -p "$parent_dir"
            fi

            ln -s "$path" "$link_path"
            echo "Created symbolic link for $path"
        fi
    else
        echo "Error: $path is not a valid directory."
    fi
done < "$input_file"

