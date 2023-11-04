#!/bin/bash

# deploy 2nd most recent load from internal/builds.env

current_dir=$(pwd)
script_dir="$(dirname "$0")"
if [ $script_dir = "." ]; then
    repo_dir="$(dirname "../$script_dir")"
else
    repo_dir="$(dirname "$script_dir")"
fi
pushd "${repo_dir}" > /dev/null
current_load=$("./internal/parse.sh")
latest_load=$(($current_load-1))

pushd "internal" > /dev/null
second_latest_executable=$(ls -t vod-service.* | head -2 | tail -1)
if [[ $current_load =~ ^[0-9]+$ ]] && [ -e "$second_latest_executable" ]; then
    echo "Running prev. load:$second_latest_executable Server..."
    "./$second_latest_executable"
    popd > /dev/null
else
    echo "Unable to run latest/Does not exist"
    popd > /dev/null
fi
popd > /dev/null