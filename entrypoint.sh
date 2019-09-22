#!/bin/sh
working=${GITHUB_WORKSPACE:-build}
name="ghost-theme-$(jq --raw-output '.name' package.json)"
tag="v$(jq --raw-output '.version' package.json)"

target="${working}/$name.zip" 
mkdir -p "${working}"
if [ -e $target ]; then
    rm $target
fi
zip $target -r * -x \*${working}\* -x \*.git\* -x \*~
export RELEASE_FILE="$target"
export RELEASE_NAME="$name"
export RELEASE_TAG="$tag"

