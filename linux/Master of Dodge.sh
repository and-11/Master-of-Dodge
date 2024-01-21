#!/bin/sh
echo -ne '\033c\033]0;Master of Dodge\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Master of Dodge.x86_64" "$@"
