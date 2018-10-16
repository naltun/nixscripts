#!/bin/bash

# Exit if an error is encountered
set -e

# Continue with script if ctrl-C/SIGINT encountered
trap ctrl_c INT
function ctrl_c() {
	echo "ctrl-C caught. Continuing with $0."
}

if [[ $EUID -ne 0 ]]; then
	echo 'Please run as root. Exiting.'
	exit 1
fi

readonly log_dir=/var/www/miq/vmdb/log/
readonly logstorage_dir=/var/www/miq/vmdb/log/logstorage/
readonly files="$(ls $log_dir)"

for file in $files; do
	case "$file" in
		"*.gz")
			echo "[$file] Moving $file to $logstorage_dir."
			mv "$file" "$logstorage_dir"
		;;

		*)
			echo "[$file] Nothing to do with $file."
		;;
	esac
done

echo 'Finished.'
exit 0

