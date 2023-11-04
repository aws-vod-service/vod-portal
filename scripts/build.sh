#!/bin/bash

current_dir=$(pwd)
script_dir="$(dirname "$0")"
if [ "$script_dir" = "." ]; then
    repo_dir="$(dirname "../$script_dir")"
else
    repo_dir="$(dirname "$script_dir")"
fi
pushd "${repo_dir}" > /dev/null
current_load=$("./internal/parse.sh")
pushd "src/" > /dev/null
if [[ $current_load =~ ^[0-9]+$ ]]; then
    go build -o "../internal/vod-service.$current_load"
    new_load=$((current_load + 1))
    popd > /dev/null
    pushd "internal/" > /dev/null
    builds_env="builds.env"

    if [ -e "$builds_env" ]; then
        sed -i "s/build|[^|]*/build|$new_load/" "$builds_env"
    else
        echo "The file $builds_env does not exist; builds not updated"
    fi
    popd > /dev/null
    echo "Build $current_load completed and returned to the original directory: $current_dir"
else
    popd > /dev/null
fi
popd > /dev/null
