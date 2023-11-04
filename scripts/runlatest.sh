#!/bin/bash

# run the 2nd most recent load from internal/builds.env

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
if [[ $current_load =~ ^[0-9]+$ ]] && [ -e "vod-service.$latest_load" ]; then
    echo "Running prev. load:$latest_load Server..."
    "./vod-service.$latest_load"
    popd > /dev/null
else
    echo "Unable to run latest/Does not exist"
    popd > /dev/null
fi
popd > /dev/null