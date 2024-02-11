#!/bin/bash



# Check if the input file exists
input_file="files"
if [[ ! -f "$input_file" ]]; then
    echo "Error: $input_file does not exist."
    exit 1
fi

# Create symbolic links for each directory path in the input file
while IFS= read -r path; do
    if [[ -e "$path" ]]; then
        link_path="/home/peter/$(echo "$path")"
        if [[ -e "$link_path" ]] && [ "$1" != "force" ]; then
            echo "Error: Symbolic link already exists for $path"
        else
            # Check if parent directories exist, and create them if needed
            parent_dir=$(dirname "$link_path")
            if [[ ! -d "$parent_dir" ]]; then
                mkdir -p "$parent_dir"
            fi
            # check if file exists and renave to bakupt
            if [[ -e "$link_path" ]]; then
                mv "$link_path" "$link_path\.bkp"
            fi
            ln -s "$path" "$link_path"
            echo "Created symbolic link for $path"
        fi
    else
        echo "Error: $path is not a valid directory."
    fi
done < "$input_file"

