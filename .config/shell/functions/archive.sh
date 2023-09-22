#!/bin/bash

script_dir="$(dirname "$0")"
source "$script_dir/ask.sh"

archive() {
	if [ $# -ne 1 ]; then
		echo "Usage: archive path_to_file_or_folder"
		return 1
	fi

	target_name="$1"
	cwd=$(pwd)
	archive_path="/archive/${cwd#/}" # remove the leading slash from cwd
	#
	# Check if target_name contains a path separator '/'
	if [[ "$target_name" == *"/"* ]]; then
		echo "Error: Please run the command from the same folder as the target name"
		return 1
	fi

	if [ -e "${target_name}" ]; then
		echo "Archiving ${target_name} to ${archive_path}/${target_name}"
		mkdir -p "${archive_path}"
		if cp -r "${target_name}" "${archive_path}"; then
			echo "Copied ${target_name} to ${archive_path}"

			if ask "Remove the original?" N && rm -r "${target_name}"; then
				echo "Removed original ${target_name}"
			else
				echo "Did not remove the original either by choice or error: ${target_name}"
				return 1
			fi
		else
			echo "Error: Failed to copy ${target_name} to ${archive_path}"
			return 1
		fi
	else
		echo "Error: ${target_name} doesn't exist"
		return 1
	fi
}
