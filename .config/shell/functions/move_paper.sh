# vim:ft=bash
function move_paper() {
	source_file="$1"
	destination_dir="$HOME/work/papers/downloads"

	if [ -z "$2" ]; then
		# Use the same name if the second argument is not supplied
		destination_file="$destination_dir/$(basename "$source_file")"
	else
		destination_file="$destination_dir/$2"
	fi

	mv "$source_file" "$destination_file"
	echo "File moved to: $destination_file"
}
