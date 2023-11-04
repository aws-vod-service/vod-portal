#!/bin/bash

current_dir=$(pwd)
script_dir="$(dirname "$0")"
if [ $script_dir = "." ]; then
    repo_dir="$(dirname "../$script_dir")"
else
    repo_dir="$(dirname "$script_dir")"
fi

pushd "${repo_dir}/src" > /dev/null
go run . 
echo "Running Server..."
popd > /dev/null
